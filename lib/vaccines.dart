import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/details.dart';

class Vaccines extends StatefulWidget {
  Vaccines({Key key}) : super(key: key);

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: VaccinationDetails()));
                },
                child: Card(
                  child: ListTile(
                    tileColor: Colors.grey[100],
                    title: Text("Dose 1"),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: VaccinationDetails()));
                },
                child: Card(
                  child: ListTile(
                    tileColor: Colors.grey[100],
                    title: Text("Dose 2"),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}
