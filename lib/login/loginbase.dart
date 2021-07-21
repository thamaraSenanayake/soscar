import 'package:flutter/material.dart';
import 'package:soscar/login/splashScreen.dart';

class LoginBase extends StatefulWidget {
  LoginBase({Key key}) : super(key: key);

  @override
  _LoginBaseState createState() => _LoginBaseState();
}

class _LoginBaseState extends State<LoginBase> implements LoginBaseListener{
  LoginPage _currentPage = LoginPage.Splash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_currentPage == LoginPage.Splash? 
        SplashScreen(listener:this):
        Container() ,
    );
  }

  @override
  moveToPage(LoginPage page) {
    // TODO: implement moveToPage
    throw UnimplementedError();
  }
}

abstract class LoginBaseListener{
  moveToPage(LoginPage page);
}

enum LoginPage{
  Splash,
  Login,
  SingIn,
}