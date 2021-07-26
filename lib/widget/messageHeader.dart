import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soscar/profileScreen.dart/messageView.dart';
import '../const.dart';

class MessageHeaderView extends StatefulWidget {
  MessageHeaderView({Key key}) : super(key: key);

  @override
  _MessageHeaderViewState createState() => _MessageHeaderViewState();
}

class _MessageHeaderViewState extends State<MessageHeaderView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:16.h),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, _, __) => MessageScreen(),
              opaque: false
            ),
          );
        },
        child: Container(
          width: AppData.width.w - 80.w,
          height: 150.h,
          padding:EdgeInsets.only(
            left:40.w,
            right:40.w
          ),
          decoration: BoxDecoration(
            // color: widget.errorText.length ==0 ?Colors.white:Colors.redAccent,
            // color: AppColors.mainColor,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                height: 120.h,
                width: 120.h,
                child: ClipRRect(
                  borderRadius:  BorderRadius.circular(100),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwQdcTwxhQr6T9QFAWOqRfLxzufrSdx9EQmw&usqp=CAU",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              
              Text(
                "Jane Silva",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 40.sp
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child:Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
