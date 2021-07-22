import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
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
      color: Colors.white,
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

                AnimationLimiter(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 475),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children:[
                        CustomButton(
                          backgroundColor: Color(0xff4267B2),
                          onTap: (){
                            widget.listener.moveToPage(LoginPage.SingIn);
                          },
                          textColor: Colors.white,
                          imageUrl: "assets/icon/facebook.svg", 
                          buttonName: "Continue with Facebook"
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          textColor: Colors.white,
                          backgroundColor: Color(0xff00B0ED),
                          onTap: (){
                            widget.listener.moveToPage(LoginPage.SingIn);
                          },
                          imageUrl: "assets/icon/twitter.svg", 
                          buttonName: "Continue with Twitter"
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          backgroundColor: Color(0xffF44336),
                          textColor: Colors.white,
                          onTap: (){
                            widget.listener.moveToPage(LoginPage.SingIn);
                          },
                          imageUrl: "assets/icon/gmail.svg", 
                          buttonName: "Continue with Email"
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onTap: (){
                            widget.listener.moveToPage(LoginPage.Login);
                          },
                          mainButton: true,
                          imageUrl: null, 
                          buttonName: "Login"
                        ),

                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:20.0,left: 10,right: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By Sining up, you agree with the",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " Terms of Services",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " Privacy Policy",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}