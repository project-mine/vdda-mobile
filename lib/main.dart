import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vdds_mobile/app_bloc.dart';
import 'package:vdds_mobile/app_repositories.dart';
import 'package:vdds_mobile/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/login.dart';
import 'package:vdds_mobile/login_bloc/login_bloc.dart';
import 'package:vdds_mobile/repositories/login_repository.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(
                  authenticateUserRepository:
                      RepositoryProvider.of<AuthenticateUserRepository>(
                          context),
                )),
      ],
      child: MyApp(),
    )
  );

  // runApp(
  //   AppRepositories(
  //     appBloc: AppBlocs(app: Tabs(0)),
  //     client: Client(),

  //     ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'VDDS Portal'),
    );
  }
}
