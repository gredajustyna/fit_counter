import 'package:fit_counter/domain/entities/workout.dart';

abstract class AddWorkoutEvent{
  final Workout? workout;

  const AddWorkoutEvent({this.workout});
}

class AddWorkout extends AddWorkoutEvent{
  const AddWorkout(Workout workout): super(workout: workout);
}