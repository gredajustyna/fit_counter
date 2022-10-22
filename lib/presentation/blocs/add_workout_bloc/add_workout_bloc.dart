import 'package:bloc/bloc.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_event.dart';
import 'package:fit_counter/presentation/blocs/add_workout_bloc/add_workout_state.dart';

import '../../../domain/usecases/add_workout_usecase.dart';

class AddWorkoutBloc extends Bloc<AddWorkoutEvent, AddWorkoutState>{
  final AddWorkoutUseCase _addWorkoutUseCase;
  AddWorkoutBloc(this._addWorkoutUseCase) : super(AddWorkoutInitial()) {
    on<AddWorkoutEvent>((event, emit) async {
      await _codeHandler(emit, event.workout!);
    });
  }

  Future<void> _codeHandler(Emitter<AddWorkoutState> emit, Workout workout) async {
    emit(AddWorkoutLoading());
    try{
      await _addWorkoutUseCase(params: workout);
      emit(AddWorkoutDone());
    }catch(e){
      emit(AddWorkoutError());
    }
  }
}