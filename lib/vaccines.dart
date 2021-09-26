import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/details.dart';
import 'package:vdds_mobile/models/vaccination_response_model.dart';

class Vaccines extends StatefulWidget {
  final vaccinationResponseModel;
  Vaccines({Key key, @required this.vaccinationResponseModel})
      : super(key: key);

  @override
  _VaccinesState createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vaccines"),
        ),
        body: Center(
          child: Column(
            children: [
              buildDosesList(widget.vaccinationResponseModel),
            ],
          ),
        ));
  }

  Widget buildDosesList(List<Dose> dose) {
    return Expanded(
        child: ListView.builder(
            itemCount: dose.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: VaccinationDetails(
                            batch: dose[index].batch,
                            expiryDate: dose[index].expiryDate,
                            id: dose[index].id,
                            name: dose[index].name,
                            vaccine: dose[index].vaccine,
                          )));
                },
                child: Card(
                  child: ListTile(
                    tileColor: Colors.grey[100],
                    title: Text('Dose: ' '${dose[index].id}'),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blue,
                ),
              );
            }));
  }
}
