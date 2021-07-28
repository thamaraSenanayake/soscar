import 'package:flutter/material.dart';
import 'package:soscar/login/login.dart';
import 'package:soscar/login/signIn.dart';
import 'package:soscar/login/splashScreen.dart';

import 'emailConformation.dart';

class LoginBase extends StatefulWidget {
  LoginBase({Key key}) : super(key: key);

  @override
  _LoginBaseState createState() => _LoginBaseState();
}

class _LoginBaseState extends State<LoginBase> implements LoginBaseListener{
  LoginPage _currentPage = LoginPage.Splash;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onBackPressed,
      child: Scaffold(
        body:_currentPage == LoginPage.Splash? 
          SplashScreen(listener:this):
          _currentPage == LoginPage.CodeCheck? 
          EmailConformation(listener:this):
          _currentPage == LoginPage.SingIn? 
          SignIn(listener: this):
          _currentPage == LoginPage.Login? 
          Login(listener: this):
          Container() ,
      ),
    );
  }

  Future<bool> _onBackPressed() {
    
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("NO"),
            ),
            SizedBox(height: 16),
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("YES"),
            ),
          ],
        ),
      ) ??
          false;
        
  }

  @override
  moveToPage(LoginPage page) {
    setState(() {
      _currentPage = page;
    });
  }
}

abstract class LoginBaseListener{
  moveToPage(LoginPage page);
}

enum LoginPage{
  Splash,
  Login,
  SingIn,
  CodeCheck
}