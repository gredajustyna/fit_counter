import 'dart:async';

import 'package:fit_counter/domain/entities/workout.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../entities/user.dart';

abstract class CodesRepository {
  Future<List<Workout>> getAllWorkouts();

  Future<void> addWorkout(Workout workout);

  Future<void> deleteAllWorkouts();

  Future<Workout> getRepetitions(Map<String, dynamic> events);

  void setGoal(int goal);

  List<dynamic> filterFrequencies(List<dynamic> events, int filterSize);

  List<dynamic> convolve(List<dynamic> events, List<dynamic> kernel);

  int calculateFilteredSize(int eventsSize, int filterSize);

  Future<User> getUser();
}