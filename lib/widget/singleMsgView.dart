import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';
import 'package:intl/intl.dart';

class SingleMessageView extends StatefulWidget {
  final String msg;
  SingleMessageView({Key key,@required this.msg}) : super(key: key);

  @override
  _SingleMessageViewState createState() => _SingleMessageViewState();
}

class _SingleMessageViewState extends State<SingleMessageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:10.h),
      child: Container(
        width: AppData.width.h-20.h,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.msg,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.sp,
                    color: Colors.black
                  ),
                ),
                Container(
                  child: Text(
                    DateFormat.jm().format(DateTime.now()),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.sp,
                      color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
            constraints: BoxConstraints(
              maxWidth: AppData.width.w - 80.w,
              minHeight: 50.h
            ),
            padding:EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              // color: AppData.,
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25)),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 12.0,
                  spreadRadius: 3.0,
                  offset: Offset(
                    1.0,
                    1.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
