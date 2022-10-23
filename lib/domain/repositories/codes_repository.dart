import 'dart:async';

import 'package:fit_counter/domain/entities/workout.dart';
import 'package:sensors_plus/sensors_plus.dart';

abstract class CodesRepository{
  Future<List<Workout>> getAllWorkouts();

  Future<void> addWorkout(Workout workout);

  Future<void> deleteAllWorkouts();

  Future<int> getRepetitions(List<UserAccelerometerEvent> events);
}