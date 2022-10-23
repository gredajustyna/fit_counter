abstract class SetGoalEvent{
  final int? goal;
  SetGoalEvent({this.goal});
}

class SetGoal extends SetGoalEvent{
  SetGoal(int goal) : super(goal: goal);
}