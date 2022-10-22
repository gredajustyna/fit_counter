import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/entities/workout.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';

class AddWorkoutUseCase implements FutureUseCase<void, Workout>{
  CodesRepository _codesRepository;
  AddWorkoutUseCase(this._codesRepository);

  @override
  Future<void> call({required Workout params}) async{
    await _codesRepository.addWorkout(params);
  }

}