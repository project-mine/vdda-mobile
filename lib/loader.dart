import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(
                microseconds: 1,
              ),
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ciibo_animation_loop.gif'),
                      fit: BoxFit.scaleDown)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
