import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/login/loginbase.dart';
import 'package:soscar/widget/customButton.dart';

class SplashScreen extends StatefulWidget {
  final LoginBaseListener listener;
  SplashScreen({Key key,@required this.listener}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 0.0;
  double _width = 0.0;
  @override
  Widget build(BuildContext context) {
    setState(() {
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width;
    });
    return Container(
      height:_height,
      width:_width,
      child: Stack(
        children:[
          SingleChildScrollView(
            child:Container(
              height:_height,
              width:_width,
              color: Colors.white,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:Padding(
                  padding: const EdgeInsets.only(top:500.0),
                  child: SvgPicture.asset("assets/images/background.svg"),
                ) ,
              ),
            )
          ),
          Container(
            height:_height,
            width:_width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/icon/logo.jpeg"
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                
                CustomButton(
                  imageUrl: "assets/icon/facebook.svg", 
                  buttonName: "Continue with Facebook"
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  imageUrl: "assets/icon/twitter.svg", 
                  buttonName: "Continue with Twitter"
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  imageUrl: "assets/icon/gmail.svg", 
                  buttonName: "Continue with Email"
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}