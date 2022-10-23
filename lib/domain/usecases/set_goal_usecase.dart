import 'package:fit_counter/core/usecases/usecase.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';

class SetGoalUseCase implements UseCase<void, int>{
  CodesRepository _codesRepository;

  SetGoalUseCase(this._codesRepository);

  @override
  void call({required int params}) {
    _codesRepository.setGoal(params);
  }

}