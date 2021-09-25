import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/details.dart';
import 'package:vdds_mobile/vaccines.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = new MaskedTextController(text: '', mask: '00-000000 000');

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
                  controller: controller,
                  decoration: InputDecoration(labelText: "Enter ID number"),

                  //controller: ,
                ),
                SizedBox(height: 10),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      shadowColor: Colors.red,
                      elevation: 10,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Vaccines()));
                    },
                    child: Text(
                      'Submit',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
