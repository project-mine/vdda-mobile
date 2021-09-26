import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/models/vaccination_response_model.dart';
import 'package:vdds_mobile/vaccines.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'bloc/vaccination_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var idController = new MaskedTextController(text: '', mask: '000000000000');
  VaccinationBloc vaccinationBloc;
  VaccinationResponseModel vaccinationResponseModel;

  @override
  void initState() {
    super.initState();

    vaccinationBloc = BlocProvider.of<VaccinationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: "Enter ID number"),

                  //controller: ,
                ),
                SizedBox(height: 10),
                BlocListener<VaccinationBloc, VaccinationState>(
                    listener: (context, state) {
                  if (state is VaccinationError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                  // TODO: implement listener
                }, child: BlocBuilder<VaccinationBloc, VaccinationState>(
                        builder: (context, state) {
                  if (state is VaccinationLoading) {
                    return buildLoading();
                  } else if (state is VaccinationLoaded) {
                    return loadedBuild(state.vaccinationResponseModel);
                  } else if (state is VaccinationError) {
                    return errorBuild();
                  }
                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.red,
                        elevation: 10,
                      ),
                      onPressed: () {
                        vaccinationBloc.add(
                            GetVaccinationDetails(idNumber: idController.text));
                      },
                      child: Text(
                        'Submit',
                      ));
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadedBuild(VaccinationResponseModel model) {
    return Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Vaccines(
              vaccinationResponseModel: model,
            )));
  }

  buildLoading() {
    return Container(
      child: Column(
        children: [
          SpinKitDoubleBounce(color: Colors.blue),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  errorBuild() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue,
          shadowColor: Colors.red,
          elevation: 10,
        ),
        onPressed: () {
          vaccinationBloc
              .add(GetVaccinationDetails(idNumber: idController.text));
        },
        child: Text(
          'Submit',
        ));
  }
}
