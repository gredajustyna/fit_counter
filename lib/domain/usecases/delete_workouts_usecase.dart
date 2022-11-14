import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';

class DeleteAllWorkoutsUseCase implements FutureUseCase<void, void>{
  CodesRepository _codesRepository;

  DeleteAllWorkoutsUseCase(this._codesRepository);

  @override
  Future<void> call({required void params}) async{
    await _codesRepository.deleteAllWorkouts();
  }

}