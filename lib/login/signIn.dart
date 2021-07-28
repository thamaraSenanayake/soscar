import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/profileScreen.dart/profileBase.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:soscar/widget/loading.dart';
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
  String _firstName= '';
  String _firstNameError= '';
  String _lastName= '';
  String _lastNameError= '';
  String _email= '';
  String _emailError= '';
  String _password= '';
  String _passwordError= '';
  String _passwordConfirmation= '';
  String _passwordConfirmationError= '';

  bool _loading = false;

  _signIn() async {
    FocusScope.of(context).unfocus();
    bool _validation = true;
    if(_firstName.isEmpty){
      setState(() {
        _firstNameError = "Required Field";
      });
      _validation = false;
    }
    if(_lastName.isEmpty){
      setState(() {
        _lastNameError = "Required Field";
      });
      _validation = false;
    }
    if(_email.isEmpty){
      setState(() {
        _emailError = "Required Field";
      });
      _validation = false;
    }
    if(_password.isEmpty){
      setState(() {
        _passwordError = "Required Field";
      });
      _validation = false;
    }
    if(_passwordConfirmation.isEmpty){
      setState(() {
        _passwordConfirmationError = "Required Field";
      });
      _validation = false;
    }else if(_passwordConfirmation != _password){
      setState(() {
        _passwordConfirmationError = "Password dosen't match";
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
      widget.listener.moveToPage(LoginPage.CodeCheck);
      // Navigator.of(context).pushReplacement(
      //   PageRouteBuilder(
      //     pageBuilder: (context, _, __) => ProfileBase(),
      //     opaque: false
      //   ),
      // );
    }
  }

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
              child: SingleChildScrollView(
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
                              height: 60.h,
                            ),
                            SizedBox(
                              height: 40.h,
                              width: AppData.width.h-80.h,
                              child: Text(
                                _firstNameError,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.sp
                                ),
                              ),
                            ),
                            TextBox(
                              textBoxKey: "", 
                              onChange: (val){
                                _firstName = val;
                                if(_firstNameError.isNotEmpty){
                                  setState(() {
                                    _firstNameError = "";                                
                                  });
                                }
                              }, 
                              errorText: _firstNameError,
                              textBoxHint: "First Name",
                              prefixIcon: "assets/icon/font.svg",
                            ),
                            SizedBox(
                              height: 40.h,
                              width: AppData.width.h-80.h,
                              child: Text(
                                _lastNameError,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.sp
                                ),
                              ),
                            ),
                            TextBox(
                              textBoxKey: "", 
                              onChange: (val){
                                _lastName = val;
                                if(_lastNameError.isNotEmpty){
                                  setState(() {
                                    _lastNameError = "";                                
                                  });
                                }
                              }, 
                              errorText: _lastNameError,
                              textBoxHint: "Last Name",
                              prefixIcon: "assets/icon/font.svg",
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
                              textBoxKey: "", 
                              textInputType: TextInputType.emailAddress,
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
                              height: 40.h,
                              width: AppData.width.h-80.h,
                              child: Text(
                                _passwordConfirmationError,
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
                                _passwordConfirmation = val;
                                if(_passwordConfirmationError.isNotEmpty){
                                  setState(() {
                                    _passwordConfirmationError = "";                                
                                  });
                                }
                              }, 
                              errorText: _passwordConfirmationError,
                              textBoxHint: "Password Confirmation",
                              prefixIcon: "assets/icon/padlock.svg",
                            ),

                            SizedBox(
                              height: 50.h,
                            ),

                            CustomButton(
                              imageUrl: null, 
                              buttonName: "Sing In", 
                              mainButton: true,
                              onTap: _signIn
                            ),

                            

                          ]
                        )
                      )
                    ),
                    

                  ],
                ),
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