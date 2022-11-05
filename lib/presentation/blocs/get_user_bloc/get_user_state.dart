import 'package:fit_counter/domain/entities/user.dart';

abstract class GetUserState{
  final User? user;
  const GetUserState({this.user});
}

class GetUserInitial extends GetUserState{
  const GetUserInitial();
}

class GetUserLoading extends GetUserState{
  const GetUserLoading();
}

class GetUserDone extends GetUserState{
  const GetUserDone(User user): super(user: user);
}

class GetUserError extends GetUserState{
  const GetUserError();
}