import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/widget/topBar.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:soscar/widget/textbox.dart';
import 'loginbase.dart';

class Login extends StatefulWidget {
  final LoginBaseListener listener;
  Login({Key key,@required this.listener}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          // Container(
          //   height: 50,
          //   color: AppColors.mainColor,
          // ),
          SingleChildScrollView(
            child:Container(
              height:_height,
              width:_width,
              // color: Colors.white,
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
            color: Colors.transparent,
            child: SafeArea(
              child: Column(
                children: [

                  TopBar(
                    name: "Login", 
                    back:(){
                      widget.listener.moveToPage(LoginPage.Splash);
                    }
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
                          SizedBox(
                            height: 50,
                          ),
                          TextBox(
                            textBoxKey: "", 
                            onChange: (val){

                            }, 
                            errorText: "",
                            textBoxHint: "Email",
                            prefixIcon: "assets/icon/gmail.svg",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextBox(
                            textBoxKey: "", 
                            onChange: (val){

                            }, 
                            errorText: "",
                            textBoxHint: "Password",
                            prefixIcon: "assets/icon/padlock.svg",
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          CustomButton(
                            imageUrl: null, 
                            buttonName: "Login", 
                            mainButton: true,
                            onTap: (){

                            }
                          ),

                          

                          SizedBox(
                            height: 30,
                          ),
                        ]
                      )
                    )
                  ),
                  

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}