import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';

class TopBar extends StatefulWidget {
  final String name;
  final Function back;
  TopBar({Key key,@required this.name,@required this.back}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      // color: AppColors.mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: (){
                widget.back();
              },
              child: Container(
                height: 60.h,
                width: 60.h,
                color: Colors.transparent,
                padding:  EdgeInsets.all(5.h),
                child: SvgPicture.asset(
                  "assets/icon/arrow.svg",
                  color: AppColors.mainColor,
                )
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.name,
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}