import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soscar/widget/messageHeader.dart';
import '../const.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height:AppData.height.h -160.h,
        width:AppData.width.w,
        color: Colors.white,
        padding: EdgeInsets.only(top:50.h),
        child: Column(
          children: [
            MessageHeaderView(),
            MessageHeaderView(),
            MessageHeaderView(),
          ],
        ),
      ),
    );
  }
}