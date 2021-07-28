import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:soscar/login/loginbase.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  final LoginBaseListener listener;
  SplashScreen({Key key,@required this.listener}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:AppData.height.h,
      width:AppData.width.w,
      color: Colors.white,
      child: Stack(
        children:[
          SingleChildScrollView(
            child:SizedBox(
              height:AppData.height.h,
              width:AppData.width.w,
              // color: Colors.white,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:Padding(
                  padding: EdgeInsets.only(top:(1000).h),
                  child: SvgPicture.asset("assets/images/background.svg"),
                ) ,
              ),
            )
          ),
          Container(
            height:AppData.height.h,
            width:AppData.width.w,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:100.h),
                  child: Container(
                    height: 300.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15)),
                        BoxShadow(
                          color:Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 11.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            3.0,
                          ),
                        )
                      ],
                    ),
                    child: Image.asset(
                      "assets/icon/logo.jpeg"
                    ),
                  ),
                ),

                SizedBox(
                  height: 150.h,
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
                          height: 40.h,
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
                          height: 40.h,
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
                          height: 50.h,
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
            padding: EdgeInsets.only(bottom:40.h,left: 20.w,right: 20.w),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By Sining up, you agree with the",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " Terms of Services",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " Privacy Policy",
                      style: TextStyle(
                        fontSize: 30.sp,
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