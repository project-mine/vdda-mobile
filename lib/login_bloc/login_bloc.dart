import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vdds_mobile/models/login_response_model.dart';
import 'package:vdds_mobile/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.authenticateUserRepository,
    LoginState initialState,
    // @required this.gadgetsRepository
  }) : super(initialState);
  final AuthenticateUserRepository authenticateUserRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthenticateUserEvent) {
      try {
        yield LoginLoading();
        var data = await authenticateUserRepository.authenticateUser(
            event.username, event.password);
        yield LoginLoaded(loginModelResponse: data);
      } catch (e) {
        print("........................." + e.message.toString());
        yield LoginError(message: e.message);
      }
    }
  }
}
