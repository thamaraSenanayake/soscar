import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:soscar/profileScreen.dart/saveImage.dart';
import 'package:soscar/widget/textbox.dart';
import '../const.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> implements SaveImageListener {
  String _userName = 'Michael Jordan';
  String _site = '';
  String _about = '';
  String _email = '';
  String _tel = '';
  bool _isMale = true;
  bool _isColorBlind = false;
  File _file;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height:AppData.height.h -160.h,
        width:AppData.width.w,
        color: Colors.white,
        padding: EdgeInsets.only(top:50.h),
        child:AnimationLimiter(
          child: SingleChildScrollView(
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
                  Text(
                    _userName,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 50.h),
                    child: Container(
                      height: 300.h,
                      width: 300.h,
                      child: Stack(
                        children: [
                          Container(
                            height: 300.h,
                            width: 300.h,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Padding(
                                padding: EdgeInsets.all(70.h),
                                child: SvgPicture.asset(
                                  "assets/icon/user.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(SaveImage(listener: this));
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
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
                                child:_file!=null?
                                Image.file(_file):
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Text(
                    "User since 2012",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  SizedBox(
                    height: 50.h,
                  ),

                  Container(
                    height: 70.h,
                    width: AppData.width.w,
                    padding: EdgeInsets.only(left:40.w),
                    child:Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Basic Profile",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  TextBox(
                    prefixIcon: "assets/icon/user.svg",
                    textBoxKey: "textBoxKey", 
                    onChange: (val){

                    }, 
                    errorText: "",
                    initText: _userName
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextBox(
                    prefixIcon: "assets/icon/internet.svg",
                    textBoxKey: "textBoxKey", 
                    onChange: (val){

                    }, 
                    errorText: "",
                    initText: _site,
                    textInputType: TextInputType.url,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextBox(
                    prefixIcon: "assets/icon/user.svg",
                    textBoxKey: "textBoxKey", 
                    onChange: (val){

                    }, 
                    errorText: "",
                    initText: _about,
                    textInputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 70.h,
                    width: AppData.width.w,
                    padding: EdgeInsets.only(left:40.w),
                    child:Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Private Information",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextBox(
                    prefixIcon: "assets/icon/gmail.svg",
                    textBoxKey: "textBoxKey", 
                    onChange: (val){

                    }, 
                    errorText: "",
                    initText: _email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextBox(
                    prefixIcon: "assets/icon/phone.svg",
                    textBoxKey: "textBoxKey", 
                    onChange: (val){

                    }, 
                    errorText: "",
                    initText: _tel,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  imageSelectType(ImageSelectType imageSelectType) async {
    // PickedFile image;
    // final picker = ImagePicker();

    // if (imageSelectType == ImageSelectType.Camera) {
    //   image = await picker.getImage(source: ImageSource.camera);
    // } else {
    //   image = await picker.getImage(source: ImageSource.gallery);
    // }
    // if(image != null){
    //   _file = File(image.path);
    // }
  }
}