import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_event.dart';

import '../../../domain/entities/workout.dart';

abstract class GetAllWorkoutsState{
  final List<Workout>? workouts;

  const GetAllWorkoutsState({this.workouts});
}

class GetAllWorkoutsInitial extends GetAllWorkoutsState{
  const GetAllWorkoutsInitial();
}

class GetAllWorkoutsLoading extends GetAllWorkoutsState{
  const GetAllWorkoutsLoading();
}

class GetAllWorkoutsDone extends GetAllWorkoutsState{
  const GetAllWorkoutsDone(List<Workout> workouts) : super(workouts: workouts);
}

class GetAllWorkoutsError extends GetAllWorkoutsState{
  const GetAllWorkoutsError();
}
