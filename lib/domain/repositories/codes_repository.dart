import 'package:fit_counter/domain/entities/workout.dart';

abstract class CodesRepository{
  Future<List<Workout>> getAllWorkouts();

  Future<void> addWorkout(Workout workout);

  Future<void> deleteAllWorkouts();
}