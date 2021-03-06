import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdds_mobile/home.dart';
import 'package:vdds_mobile/login_bloc/login_bloc.dart';
import 'package:vdds_mobile/models/login_response_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc loginBloc;
  LoginModelResponse loginModelResponse;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _usernameController.text='thabo@testmail.com';
    _passwordController.text='56aysgauia65';

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: height * 0.5,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          suffixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                      // TODO: implement listener
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return buildLoading();
                        } else if (state is LoginLoaded) {
                          return loadedBuild(state.loginModelResponse);
                        } else if (state is LoginError) {
                          return errorBuild();
                        }
                        return RaisedButton(
                          child: Text('Login'),
                          color: Colors.blue,
                          onPressed: () {
                            loginBloc.add(AuthenticateUserEvent(
                                username: _usernameController.text,
                                password: _passwordController.text));

                            print(_usernameController.text +
                                _passwordController.text);
                            print("event trigered");
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Home()));
                    },
                    child: Text.rich(
                      TextSpan(text: 'Don\'t have an account  ', children: [
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loadedBuild(LoginModelResponse model) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()));
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
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      onPressed: () {
        loginBloc.add(AuthenticateUserEvent(
            username: _usernameController.text,
            password: _passwordController.text));

        print(_usernameController.text + _passwordController.text);
        print("event trigered");
      },
    );
  }
}
