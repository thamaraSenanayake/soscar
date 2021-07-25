import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:soscar/widget/textbox.dart';
import 'package:soscar/widget/topBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';
import 'loginbase.dart';

class SignIn extends StatefulWidget {
  final LoginBaseListener listener;
  SignIn({Key key,@required this.listener}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    setState(() {
    });
    return Container(
      height:AppData.height.h,
      width:AppData.width.w,
      color: Colors.white,
      child: Stack(
        children:[
          // Container(
          //   height: 50,
          //   color: AppColors.mainColor,
          // ),
          SingleChildScrollView(
            child:SizedBox(
              height:AppData.height.h,
              width:AppData.width.w,
              // color: Colors.white,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:Padding(
                  padding:  EdgeInsets.only(top:1000.h),
                  child: SvgPicture.asset("assets/images/background.svg"),
                ) ,
              ),
            )
          ),
          Container(
            height:AppData.height.h,
            width:AppData.width.w,
            color: Colors.transparent,
            child: SafeArea(
              child: Column(
                children: [

                  TopBar(
                    name: "Sign in", 
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
                            height: 100.h,
                          ),
                          TextBox(
                            textBoxKey: "", 
                            onChange: (val){

                            }, 
                            errorText: "",
                            textBoxHint: "First Name",
                            prefixIcon: "assets/icon/font.svg",
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          TextBox(
                            textBoxKey: "", 
                            onChange: (val){

                            }, 
                            errorText: "",
                            textBoxHint: "Last Name",
                            prefixIcon: "assets/icon/font.svg",
                          ),
                          SizedBox(
                            height: 40.h,
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
                            height: 40.h,
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
                            height: 60.h,
                          ),

                          CustomButton(
                            imageUrl: null, 
                            buttonName: "Sing In", 
                            mainButton: true,
                            onTap: (){

                            }
                          ),

                          

                          SizedBox(
                            height: 60.h,
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