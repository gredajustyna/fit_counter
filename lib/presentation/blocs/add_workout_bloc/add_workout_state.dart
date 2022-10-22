abstract class AddWorkoutState{
  const AddWorkoutState();
}

class AddWorkoutInitial extends AddWorkoutState{
  const AddWorkoutInitial();
}

class AddWorkoutLoading extends AddWorkoutState{
  const AddWorkoutLoading();
}

class AddWorkoutError extends AddWorkoutState{
  const AddWorkoutError();
}

class AddWorkoutDone extends AddWorkoutState{
  const AddWorkoutDone();
}