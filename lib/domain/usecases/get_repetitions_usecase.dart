import 'dart:async';

import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GetRepetitionsUseCase implements FutureUseCase<Workout, Map<String, dynamic>>{
  CodesRepository _codesRepository;

  GetRepetitionsUseCase(this._codesRepository);

  @override
  Future<Workout> call({required Map<String, dynamic> params}) async{
    return await _codesRepository.getRepetitions(params);
  }

}