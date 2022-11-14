abstract class DeleteWorkoutsState{
  const DeleteWorkoutsState();
}

class DeleteWorkoutsInitial extends DeleteWorkoutsState{
  const DeleteWorkoutsInitial();
}

class DeleteWorkoutsLoading extends DeleteWorkoutsState{
  const DeleteWorkoutsLoading();
}

class DeleteWorkoutsDone extends DeleteWorkoutsState{
  const DeleteWorkoutsDone();
}

class DeleteWorkoutsError extends DeleteWorkoutsState{
  const DeleteWorkoutsError();
}