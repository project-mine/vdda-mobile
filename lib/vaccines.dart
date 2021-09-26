import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/details.dart';
import 'package:vdds_mobile/models/vaccination_response.dart';

class Vaccines extends StatefulWidget {
  final List<VaccinationResponse> vaccinationResponseModel;
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

  Widget buildDosesList(List<VaccinationResponse> vaccinations) {
    return Expanded(
        child: ListView.builder(
            itemCount: vaccinations.length,
            itemBuilder: (context, index) {
              final vaccination = vaccinations[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: VaccinationDetails(
                            batch: vaccination.dose.batch,
                            expiryDate: DateTime.parse(vaccination.dose.expiryDate),
                            id: vaccination.dose.id,
                            name: vaccination.dose.name,
                            vaccine: vaccination.dose.vaccine,
                          )));
                },
                child: Card(
                  child: ListTile(
                    tileColor: Colors.grey[100],
                    title: Text('Dose: ' '${vaccination.dose.name}'),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blue,
                ),
              );
            }));
  }
}
