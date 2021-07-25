import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String imageUrl;
  final String buttonName;
  final Function onTap;
  final bool mainButton;
  final Color backgroundColor;
  final Color textColor;
  CustomButton({Key key,@required this.imageUrl,@required this.buttonName,@required this.onTap, this.mainButton = false, this.backgroundColor = Colors.white ,this.textColor = Colors.black}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap();
      },
      child: Container(
        width: AppData.width.w - 80.w,
        height:100.h,
        decoration: BoxDecoration(
          color:widget.mainButton? AppColors.mainColor:widget.backgroundColor,
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
        child: Stack(
          children: [
            widget.imageUrl != null? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 100.h,
                width: 100.w,
                padding:EdgeInsets.all(5.h),
                child: SvgPicture.asset(widget.imageUrl)
              )
            ):Container(),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.buttonName,
                style:widget.mainButton? TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                  ):TextStyle(
                    color: widget.textColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500
                  ),
              )
            ),

            widget.mainButton?
            Padding(
              padding:  EdgeInsets.only(right:20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  padding:  EdgeInsets.all(10.h),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      "assets/icon/arrow.svg",
                      color: Colors.white,
                    )
                  )
                )
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}