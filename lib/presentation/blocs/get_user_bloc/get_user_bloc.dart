import 'package:bloc/bloc.dart';
import 'package:fit_counter/domain/usecases/get_user_usecase.dart';
import 'package:fit_counter/presentation/blocs/get_user_bloc/get_user_event.dart';
import 'package:fit_counter/presentation/blocs/get_user_bloc/get_user_state.dart';

import '../../../domain/entities/user.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState>{
  final GetUserUseCase _getUserUseCase;
  GetUserBloc(this._getUserUseCase) : super(GetUserInitial()) {
    on<GetUserEvent>((event, emit) async {
      await _handler(emit);
    });
  }

  Future<void> _handler(Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try{
      User user = await _getUserUseCase(params: null);
      emit(GetUserDone(user));
    }catch(e){
      emit(GetUserError());
    }
  }
}