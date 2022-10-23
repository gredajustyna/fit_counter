import 'dart:async';

import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';
import 'package:intl/intl.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';


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
  Future<void> deleteAllWorkouts() {
    // TODO: implement deleteAllWorkouts
    throw UnimplementedError();
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
  Future<int> getRepetitions(List<UserAccelerometerEvent> events) async{
    print(events);
    print("differences in x:");
    for (UserAccelerometerEvent event in events){
      print(event.x);
    }
    return 0;
  }

  @override
  void setGoal(int goal) async {
    preferences.setInt("goal", goal);
  }

}