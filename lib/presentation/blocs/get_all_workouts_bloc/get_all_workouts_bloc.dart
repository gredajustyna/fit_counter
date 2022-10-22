import 'package:bloc/bloc.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_event.dart';
import 'package:fit_counter/presentation/blocs/get_all_workouts_bloc/get_all_workouts_state.dart';

import '../../../domain/usecases/get_all_workouts_usecase.dart';

class GetAllWorkoutsBloc extends Bloc<GetAllWorkoutsEvent, GetAllWorkoutsState>{
  final GetAllWorkoutsUseCase _getAllWorkoutsUseCase;
  GetAllWorkoutsBloc(this._getAllWorkoutsUseCase) : super(GetAllWorkoutsInitial()) {
    on<GetAllWorkoutsEvent>((event, emit) async {
      await _handler(emit);
    });
  }

  Future<void> _handler(Emitter<GetAllWorkoutsState> emit) async {
    emit(GetAllWorkoutsLoading());
    try{
      var result = await _getAllWorkoutsUseCase(params: null);
      print(result);
      emit(GetAllWorkoutsDone(result));
    }catch(e){
      print(e);
      emit(GetAllWorkoutsError());
    }
  }
}