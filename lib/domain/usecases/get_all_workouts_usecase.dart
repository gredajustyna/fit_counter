import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';

import '../entities/workout.dart';

class GetAllWorkoutsUseCase implements FutureUseCase<List<Workout>, void>{
  CodesRepository _codesRepository;

  GetAllWorkoutsUseCase(this._codesRepository);

  @override
  Future<List<Workout>> call({required void params}) async{
    return await _codesRepository.getAllWorkouts();
  }

}