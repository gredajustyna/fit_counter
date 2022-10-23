abstract class SetGoalState{
  SetGoalState();
}

class SetGoalInitial extends SetGoalState{
  SetGoalInitial();
}

class SetGoalLoading extends SetGoalState{
  SetGoalLoading();
}

class SetGoalDone extends SetGoalState{
  SetGoalDone();
}

class SetGoalError extends SetGoalState{
  SetGoalError();
}