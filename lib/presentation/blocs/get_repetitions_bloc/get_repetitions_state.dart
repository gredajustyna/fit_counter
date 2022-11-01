import '../../../domain/entities/workout.dart';

abstract class GetRepetitionsState{
  final Workout? workout;
  const GetRepetitionsState({this.workout});
}

class GetRepetitionsInitial extends GetRepetitionsState{
  const GetRepetitionsInitial();
}

class GetRepetitionsLoading extends GetRepetitionsState{
  const GetRepetitionsLoading();
}

class GetRepetitionsDone extends GetRepetitionsState{
  const GetRepetitionsDone(Workout workout):super(workout: workout);
}

class GetRepetitionsError extends GetRepetitionsState{
  const GetRepetitionsError();
}