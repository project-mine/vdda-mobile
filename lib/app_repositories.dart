import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' show Client;
import 'package:vdds_mobile/repositories/login_repository.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBloc;

  final Client client;

  const AppRepositories({
    @required this.appBloc,
    @required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            //  create: (BuildContext context) {},
            create: (context) => AuthenticateUserRepository()),
      ],
      child: appBloc,
    );
  }
}
