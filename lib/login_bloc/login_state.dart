part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModelResponse loginModelResponse;

  LoginLoaded({@required this.loginModelResponse});
}

class LoginError extends LoginState {
  final String message;

  LoginError({@required this.message});
  @override
  List<Object> get props => [message];
}
