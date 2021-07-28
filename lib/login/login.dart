import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:soscar/profileScreen.dart/profileBase.dart';
import 'package:soscar/widget/loading.dart';
import 'package:soscar/widget/topBar.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:soscar/widget/textbox.dart';
import 'loginbase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  final LoginBaseListener listener;
  Login({Key key,@required this.listener}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _emailError = '';
  String _password = '';
  String _passwordError = '';
  bool _loading = false;



  _login() async {
    FocusScope.of(context).unfocus();
    bool _validation = true;
    if( _email.isEmpty){
      setState(() {
        _emailError = "Required Field";        
      });
      _validation = false;
    }
    if( _password.isEmpty){
      setState(() {
        _passwordError = "Required Field";        
      });
      _validation = false;
    }

    if(_validation){
      if(mounted)
      setState(() {
        _loading = true;
      });
      // todo call sigin API 
       await new Future.delayed(const Duration(seconds :2));
      if(mounted)
      setState(() {
        _loading = false;
      });
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, _, __) => ProfileBase(),
          opaque: false
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child:Container(
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
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            width: AppData.width.h-80.h,
                            child: Text(
                              _emailError,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.sp
                              ),
                            ),
                          ),
                          TextBox(
                            textInputType: TextInputType.emailAddress,
                            textBoxKey: "", 
                            onChange: (val){
                              _email = val;
                              if(_emailError.isNotEmpty){
                                setState(() {
                                  _emailError = "";                                
                                });
                              }
                            }, 
                            errorText: _emailError,
                            textBoxHint: "Email",
                            prefixIcon: "assets/icon/gmail.svg",
                          ),
                          SizedBox(
                            height: 40.h,
                            width: AppData.width.h-80.h,
                            child: Text(
                              _passwordError,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.sp
                              ),
                            ),
                          ),
                          TextBox(
                            obscureText: true,
                            textBoxKey: "", 
                            onChange: (val){
                              _password = val;
                              if(_passwordError.isNotEmpty){
                                setState(() {
                                  _passwordError = "";                                
                                });
                              }
                            }, 
                            errorText: _passwordError,
                            textBoxHint: "Password",
                            prefixIcon: "assets/icon/padlock.svg",
                          ),

                          SizedBox(
                            height: 50.h,
                          ),

                          CustomButton(
                            imageUrl: null, 
                            buttonName: "Login", 
                            mainButton: true,
                            onTap: (){
                              _login();
                            }
                          ),

                          

                          SizedBox(
                            height: 30.h,
                          ),
                        ]
                      )
                    )
                  ),
                  

                ],
              ),
            ),
          ),

          _loading?
          Loading():Container()

        ],
      ),
    );
  }
}