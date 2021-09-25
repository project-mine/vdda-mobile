import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vdds_mobile/app_bloc.dart';
import 'package:vdds_mobile/app_repositories.dart';
import 'package:vdds_mobile/login.dart';

void main() {
  runApp(AppRepositories(
    appBloc: AppBlocs(app: MyApp()),
    client: Client(),
  ));
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
