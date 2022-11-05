import 'dart:async';

import 'package:fit_counter/domain/entities/user.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';
import 'package:intl/intl.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:scidart/scidart.dart';


class CodesRepositoryImpl implements CodesRepository{
  final Database _database;
  final SharedPreferences preferences;
  CodesRepositoryImpl(this._database, this.preferences);

  @override
  Future<void> addWorkout(Workout workout) async{
    final db = _database;
    var res = await db.rawInsert(
        'INSERT INTO workouts (date, time, repetitions) VALUES (?, ?, ?)',
        [workout.date, workout.time, workout.repetitions]);
  }

  @override
  Future<void> deleteAllWorkouts() async{
    final db = _database;
    var res = await db.rawDelete('DELETE * FROM workouts');
  }

  @override
  Future<List<Workout>> getAllWorkouts() async{
    final db = _database;
    // Query the table for all The Passwords.
    final List<Map<String, dynamic>> maps = await db.query('workouts');
    // Convert the List<Map<String, dynamic> into a List<PasswordModel>.
    return List.generate(maps.length, (i) {
      return Workout(
          date: maps[i]['date'],
          time: maps[i]['time'],
          repetitions: maps[i]['repetitions']
      );
    });
  }

  @override
  Future<Workout> getRepetitions(Map<String, dynamic> events) async{
    var reps = 0;
    var threshold = 12;
    var yevents = [];
    for(AccelerometerEvent event in events['events']){
      yevents.add(event.y);
    }

    var filteredEvents = filterFrequencies(yevents, 5);
    var segment_started = false;

    for(var event in filteredEvents){
      if(event > threshold){
        if(!segment_started){
          segment_started = true;
        }
      }
      if(event < threshold){
        if(segment_started){
          segment_started = false;
          reps+=1;
        }
      }
    }
    if(segment_started){
      reps+=1;
    }

    Workout workout = Workout(date: DateFormat('dd-MM-yyyy').format(DateTime.now()), time: events['time'], repetitions: reps);
    return workout;
  }

  @override
  void setGoal(int goal) async {
    preferences.setInt("goal", goal);
  }

  @override
  List filterFrequencies(List<dynamic> events, int filterSize) {
    List<double> kernel = [];
    for(int i=0; i<filterSize; i++){
      kernel.add(1/filterSize);
    }
    var filteredEvents = convolve(events, kernel);
    return filteredEvents;
  }

  @override
  List convolve(List<dynamic> events, List<dynamic> kernel) {
    var filteredSize =calculateFilteredSize(events.length, kernel.length);
    int k = kernel.length;
    var convolutionResult = [];
    for(int i = 0; i<filteredSize; i++){
      var currentMatrix = events.sublist(i, i+k);
      double sum = 0;
      for (int j=0; j<currentMatrix.length; j++){
        sum += currentMatrix[j] * kernel[j];
      }
      convolutionResult.add(sum);
    }
    return convolutionResult;
  }

  @override
  int calculateFilteredSize(int eventsSize, int filterSize) {
    int size = 0;
    for(int i=0; i<eventsSize; i++) {
      var added = i + filterSize;
      if(added <= filterSize){
        size+=1;
      }
    }
    return size;
  }

  @override
  Future<User> getUser() async{
    String username = preferences.getString('username')!;
    String gender = preferences.getString('gender')!;
    int goal = preferences.getInt('goal')!;
    User user = User(username: username, goal: goal, gender: gender);
    return user;
  }

}