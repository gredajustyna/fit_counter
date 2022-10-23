import 'package:bloc/bloc.dart';
import 'package:fit_counter/presentation/blocs/set_goal_bloc/set_goal_event.dart';
import 'package:fit_counter/presentation/blocs/set_goal_bloc/set_goal_state.dart';

import '../../../domain/usecases/set_goal_usecase.dart';

class SetGoalBloc extends Bloc<SetGoalEvent, SetGoalState>{
  final SetGoalUseCase _setGoalUseCase;
  SetGoalBloc(this._setGoalUseCase) : super(SetGoalInitial()) {
    on<SetGoalEvent>((event, emit) async {
      await _handler(emit, event.goal!);
    });
  }

  Future<void> _handler(Emitter<SetGoalState> emit, int goal) async {
    emit(SetGoalLoading());
    try{
      _setGoalUseCase(params: goal);
      emit(SetGoalDone());
    }catch(e){
      print(e);
      emit(SetGoalError());
    }
  }
}