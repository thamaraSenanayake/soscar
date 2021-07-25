import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearLoc extends StatefulWidget {
  NearLoc({Key key}) : super(key: key);

  @override
  _NearLocState createState() => _NearLocState();
}

class _NearLocState extends State<NearLoc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:20.h),
      child: Card(
        child: Container(
          height: 100.h,
          width: AppData.width.w-80.w,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                height: 100.h,
                width: 150.w,
                child: Image.network(
                  "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1209106512%2F960x0.jpg%3Ffit%3Dscale",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Walmart",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "5 meters",
                        style: TextStyle(
                          fontSize: 25.sp,
                          // fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        color: AppColors.mainColor,
                      )
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}