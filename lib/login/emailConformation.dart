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

class EmailConformation extends StatefulWidget {
  final LoginBaseListener listener;
  EmailConformation({Key key,@required this.listener}) : super(key: key);

  @override
  _EmailConformationState createState() => _EmailConformationState();
}

class _EmailConformationState extends State<EmailConformation> {
  String _num1 = '';
  String _num2 = '';
  String _num3 = '';
  String _num4 = '';
  String _codeError = '';
  bool _loading = false;



  _login() async {
    if( _num1.isEmpty || _num2.isEmpty || _num3.isEmpty || _num4.isEmpty){
      setState(() {
        _codeError = "Required Field";        
      });
    }
    else{
      if(mounted)
      setState(() {
        _loading = true;
      });
      // todo call code validate API 
       await new Future.delayed(const Duration(seconds :2));
      if(mounted)
      setState(() {
        _loading = false;
      });
      Navigator.of(context).push(
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
                              _codeError,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.sp
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 100.h,
                                width: 100.h,
                                child: TextBox(
                                  textInputType: TextInputType.number,
                                  textBoxKey: "", 
                                  onChange: (val){
                                    _num1 = val;
                                    if(_codeError.isNotEmpty){
                                      setState(() {
                                        _codeError = "";                                
                                      });
                                    }
                                  }, 
                                  errorText: _codeError,
                                  textBoxHint: "",
                                ),
                              ),
                              SizedBox(
                                height: 100.h,
                                width: 100.h,
                                child: TextBox(
                                  textInputType: TextInputType.number,
                                  textBoxKey: "", 
                                  onChange: (val){
                                    _num2 = val;
                                    if(_codeError.isNotEmpty){
                                      setState(() {
                                        _codeError = "";                                
                                      });
                                    }
                                  }, 
                                  errorText: _codeError,
                                  textBoxHint: "",
                                ),
                              ),
                              SizedBox(
                                height: 100.h,
                                width: 100.h,
                                child: TextBox(
                                  textInputType: TextInputType.number,
                                  textBoxKey: "", 
                                  onChange: (val){
                                    _num3 = val;
                                    if(_codeError.isNotEmpty){
                                      setState(() {
                                        _codeError = "";                                
                                      });
                                    }
                                  }, 
                                  errorText: _codeError,
                                  textBoxHint: "",
                                ),
                              ),
                              SizedBox(
                                height: 100.h,
                                width: 100.h,
                                child: TextBox(
                                  textInputType: TextInputType.number,
                                  textBoxKey: "", 
                                  onChange: (val){
                                    _num4 = val;
                                    if(_codeError.isNotEmpty){
                                      setState(() {
                                        _codeError = "";                                
                                      });
                                    }
                                  }, 
                                  errorText: _codeError,
                                  textBoxHint: "",
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 40.h,
                            width: AppData.width.h-80.h,
                            child: Text(
                              "Enter the code which we send to your email abc@gmail.com",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.sp
                              ),
                            ),
                          ),

                          

                          CustomButton(
                            imageUrl: null, 
                            buttonName: "Done", 
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