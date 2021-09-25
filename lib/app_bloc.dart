import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdds_mobile/login_bloc/login_bloc.dart';
import 'package:vdds_mobile/repositories/login_repository.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  const AppBlocs({@required this.app});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(
                  authenticateUserRepository:
                      RepositoryProvider.of<AuthenticateUserRepository>(
                          context),
                )),
      ],
      child: app,
    );
  }
}
