part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

///loading state
class LoginLoading extends LoginState {}

///loaded state
class LoginLoaded extends LoginState {
  ///constructor
  LoginLoaded({
    required this.result,
  });

  final Result<dynamic> result;
}

///exception
class LoginException<T> extends LoginState {
  ///constructor
  LoginException({
    required this.error,
  });

  ///exception message
  final Result<T> error;
}
