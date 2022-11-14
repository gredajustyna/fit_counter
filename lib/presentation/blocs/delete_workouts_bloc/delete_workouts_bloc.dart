import 'package:bloc/bloc.dart';
import 'package:fit_counter/presentation/blocs/delete_workouts_bloc/delete_workouts_event.dart';
import 'package:fit_counter/presentation/blocs/delete_workouts_bloc/delete_workouts_state.dart';

import '../../../domain/usecases/delete_workouts_usecase.dart';

class DeleteWorkoutsBloc extends Bloc<DeleteWorkoutsEvent, DeleteWorkoutsState>{
  final DeleteAllWorkoutsUseCase _deleteWorkoutsUseCase;
  DeleteWorkoutsBloc(this._deleteWorkoutsUseCase) : super(DeleteWorkoutsInitial()) {
    on<DeleteWorkoutsEvent>((event, emit) async {
      await _codeHandler(emit);
    });
  }

  Future<void> _codeHandler(Emitter<DeleteWorkoutsState> emit) async {
    emit(DeleteWorkoutsLoading());
    try{
      await _deleteWorkoutsUseCase(params: null);
      emit(DeleteWorkoutsDone());
    }catch(e){
      emit(DeleteWorkoutsError());
    }
  }
}