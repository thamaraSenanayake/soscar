import 'package:flutter/material.dart';
import 'package:soscar/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:AppData.height.h,
      width:AppData.width.w,
      color: Colors.black.withOpacity(0.5),
      child: Align(
        alignment:Alignment.bottomCenter,
        child:SizedBox(
          width:AppData.width.w,
          child: Image.asset(
            "assets/images/giphy.gif"
          ),
        ) ,
      ),
    );
  }
}