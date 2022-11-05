import 'package:fit_counter/core/usecases/future_usecase.dart';
import 'package:fit_counter/domain/entities/user.dart';
import 'package:fit_counter/domain/repositories/codes_repository.dart';

class GetUserUseCase implements FutureUseCase<User, void>{
  CodesRepository _codesRepository;

  GetUserUseCase(this._codesRepository);

  @override
  Future<User> call({required void params}) async{
    return await _codesRepository.getUser();
  }
  
}