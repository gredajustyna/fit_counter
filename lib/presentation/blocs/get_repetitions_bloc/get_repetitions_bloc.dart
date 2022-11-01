import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fit_counter/presentation/blocs/get_repetitions_bloc/get_repetitions_event.dart';
import 'package:fit_counter/presentation/blocs/get_repetitions_bloc/get_repetitions_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../domain/usecases/get_repetitions_usecase.dart';

class GetRepetitionsBloc extends Bloc<GetRepetitionsEvent, GetRepetitionsState>{
  final GetRepetitionsUseCase _getRepetitionsUseCase;
  GetRepetitionsBloc(this._getRepetitionsUseCase) : super(GetRepetitionsInitial()) {
    on<GetRepetitionsEvent>((event, emit) async {
      await _handler(emit, event.events!);
    });
  }

  Future<void> _handler(Emitter<GetRepetitionsState> emit, Map<String, dynamic> events) async {
    emit(GetRepetitionsLoading());
    try{
      var result = await _getRepetitionsUseCase(params: events);
      print(result);
      emit(GetRepetitionsDone(result));
    }catch(e){
      print(e);
      emit(GetRepetitionsError());
    }
  }
}