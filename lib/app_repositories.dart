import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' show Client;

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
          create: (BuildContext context) {},
          // create: (context) => GadgetsRepository(
          //   gadgetsProvider: AllGadgetsProvider(

          //   ),
          // ),
        ),
      ],
      child: appBloc,
    );
  }
}
