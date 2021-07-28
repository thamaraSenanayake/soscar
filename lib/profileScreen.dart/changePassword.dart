import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soscar/widget/customButton.dart';
import 'package:soscar/widget/textbox.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _confirmNewPasswordError = '';
  String _confirmPassword = '';
  String _currentPassword = '';
  String _password = '';
  String _currentPasswordError= '';
  String _newPasswordError = '';

  _changePassword(){
    FocusScope.of(context).unfocus();
    bool _validation = true;
    if(_confirmPassword.isEmpty){
      setState(() {
        _confirmNewPasswordError = "Required Field";        
      });
      _validation = false;
    }
    if(_currentPassword.isEmpty){
      setState(() {
        _currentPasswordError = "Required Field";        
      });
      _validation = false;
    }
    if(_password.isEmpty){
      setState(() {
        _newPasswordError = "Required Field";        
      });
      _validation = false;
    }

    if(_validation){
      //todo change Password
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          "Change Password",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 20
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            color: AppColors.mainColor,
            padding:  EdgeInsets.all(30.h),
            child: SvgPicture.asset(
              "assets/icon/arrow.svg",
              color:Colors.white,
            )
          ),
        ),
        
      ),
      body: SizedBox(
        width: AppData.width,
        child:AnimationLimiter(
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
                    _currentPasswordError,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30.sp
                    ),
                  ),
                ),
                TextBox(
                  obscureText: true,
                  textInputType: TextInputType.emailAddress,
                  textBoxKey: "", 
                  onChange: (val){
                    _currentPassword = val;
                    if(_currentPasswordError.isNotEmpty){
                      setState(() {
                        _currentPasswordError = "";                                
                      });
                    }
                  }, 
                  errorText: _currentPasswordError,
                  textBoxHint: "Current Password",
                  prefixIcon: "assets/icon/padlock.svg",
                ),
                SizedBox(
                  height: 40.h,
                  width: AppData.width.h-80.h,
                  child: Text(
                    _newPasswordError,
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
                    if(_newPasswordError.isNotEmpty){
                      setState(() {
                        _newPasswordError = "";                                
                      });
                    }
                  }, 
                  errorText: _newPasswordError,
                  textBoxHint: "Password",
                  prefixIcon: "assets/icon/padlock.svg",
                ),
                SizedBox(
                  height: 40.h,
                  width: AppData.width.h-80.h,
                  child: Text(
                    _confirmNewPasswordError,
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
                    _confirmPassword = val;
                    if(_confirmNewPasswordError.isNotEmpty){
                      setState(() {
                        _confirmNewPasswordError = "";                                
                      });
                    }
                  }, 
                  errorText: _confirmNewPasswordError,
                  textBoxHint: "Confirm Password",
                  prefixIcon: "assets/icon/padlock.svg",
                ),

                SizedBox(
                  height: 50.h,
                ),

                CustomButton(
                  imageUrl: null, 
                  buttonName: "Change Password", 
                  mainButton: true,
                  onTap: (){
                    _changePassword();
                  }
                ),

                

                SizedBox(
                  height: 30.h,
                ),
              ]
            )
          )
        ),
      ),
    );
  }
}