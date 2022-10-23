import 'dart:async';

import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GetRepetitionsUseCase implements FutureUseCase<int, List<UserAccelerometerEvent>>{
  CodesRepository _codesRepository;

  GetRepetitionsUseCase(this._codesRepository);

  @override
  Future<int> call({required List<UserAccelerometerEvent> params}) async{
    return await _codesRepository.getRepetitions(params);
  }

}