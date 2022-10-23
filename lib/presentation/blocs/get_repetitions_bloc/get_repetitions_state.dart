abstract class GetRepetitionsState{
  final int? repetitions;
  const GetRepetitionsState({this.repetitions});
}

class GetRepetitionsInitial extends GetRepetitionsState{
  const GetRepetitionsInitial();
}

class GetRepetitionsLoading extends GetRepetitionsState{
  const GetRepetitionsLoading();
}

class GetRepetitionsDone extends GetRepetitionsState{
  const GetRepetitionsDone(int repetitions):super(repetitions: repetitions);
}

class GetRepetitionsError extends GetRepetitionsState{
  const GetRepetitionsError();
}