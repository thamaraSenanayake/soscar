import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:soscar/profileScreen.dart/profileBase.dart';
import 'package:soscar/widget/loading.dart';
import 'package:soscar/widget/smallTextBox.dart';
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
  FocusNode _num1Focus = FocusNode();
  String _num2 = '';
  FocusNode _num2Focus = FocusNode();
  String _num3 = '';
  FocusNode _num3Focus = FocusNode();
  String _num4 = '';
  FocusNode _num4Focus = FocusNode();
  String _codeError = '';
  bool _loading = false;



  _checkCode() async {
    FocusScope.of(context).unfocus();
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
                    name: "Email Verification", 
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
                          Container(
                            
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child: SmallTextBox(
                                    textInputType: TextInputType.number,
                                    textBoxKey: "", 
                                    focusNode: _num1Focus,
                                    onChange: (val){
                                      _num1 = val;
                                      if(_codeError.isNotEmpty){
                                        setState(() {
                                          _codeError = "";                                
                                        });
                                      }
                                      if(val.isNotEmpty){
                                        _num2Focus.requestFocus();
                                      }
                                    }, 
                                    errorText: _codeError,
                                    textBoxHint: "",
                                  ),
                                ),
                                SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child: SmallTextBox(
                                    textInputType: TextInputType.number,
                                    textBoxKey: "", 
                                    focusNode: _num2Focus,
                                    onChange: (val){
                                      _num2 = val;
                                      if(_codeError.isNotEmpty){
                                        setState(() {
                                          _codeError = "";                                
                                        });
                                      }
                                      if(val.isNotEmpty){
                                        _num3Focus.requestFocus();
                                      }
                                    }, 
                                    errorText: _codeError,
                                    textBoxHint: "",
                                  ),
                                ),
                                SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child: SmallTextBox(
                                    textInputType: TextInputType.number,
                                    textBoxKey: "", 
                                    focusNode: _num3Focus,
                                    onChange: (val){
                                      _num3 = val;
                                      if(_codeError.isNotEmpty){
                                        setState(() {
                                          _codeError = "";                                
                                        });
                                      }
                                      if(val.isNotEmpty){
                                        _num4Focus.requestFocus();
                                      }
                                    }, 
                                    errorText: _codeError,
                                    textBoxHint: "",
                                  ),
                                ),
                                SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child: SmallTextBox(
                                    textInputType: TextInputType.number,
                                    textBoxKey: "", 
                                    focusNode: _num4Focus,
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
                          ),

                          SizedBox(
                            height:100.h
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
                              textAlign: TextAlign.center,
                            ),
                          ),

                          SizedBox(
                            height:150.h
                          ),

                          CustomButton(
                            imageUrl: null, 
                            buttonName: "Done", 
                            mainButton: true,
                            onTap: (){
                              _checkCode();
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