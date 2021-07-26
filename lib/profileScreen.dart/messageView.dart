import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/widget/loading.dart';
import 'package:soscar/widget/singleMsgView.dart';

import '../const.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  ScrollController _controller;
  List<Widget> _msgListWidget = [];
  List<String> _msgList = [];
  TextEditingController _messageController = TextEditingController();
  
  bool _loading = false; 
  bool _firstLoad = true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      _loadMsg();
    });
  }

  _loadMsg() async {

    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );

    _msgListener();
    // _c
    // _controller = ScrollController(
    //   initialScrollOffset: 0.0,
    //   keepScrollOffset: true,
    // );
  }

  _msgListener(){
    List<Widget> _msgListWidgetTemp = [];


  }

  _sendMsg(){
    String text = _messageController.text;
    List<Widget> _msgListWidgetTemp = [];

    if(text.isEmpty){
      return;
    }
    _messageController.text = '';

    _msgList.add(text);

    for (var item in _msgList) {
      _msgListWidgetTemp.add(
        SingleMessageView(msg:item)
      );
    }
    if(mounted){
      setState(() {
        _msgListWidget = _msgListWidgetTemp;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height:AppData.height.h,
        width:AppData.width.w,
        child: Stack(
          children: [
            _loading? Loading() :Container(),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width:AppData.width.w,
                height: 100.h,
                color: AppColors.mainColor,
              ),
            ),
        
            Container(
              height:AppData.height.h,
              width:AppData.width.w,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 80.h,
                      width:AppData.width.w,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                      ),
                      child: Stack(
                        children: [
                          
                          Center(
                            child: Container(
                              width:AppData.width.w - 100.w,
                              height: 80.h,
                              child: Padding(
                                padding: EdgeInsets.only(top:16.h),
                                child: Text(
                                  "Jane Silva",
                                  style: TextStyle(
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left:20.w),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 70.h,
                                width: 70.w,
                                padding:  EdgeInsets.all(10.h),
                                color: AppColors.mainColor,
                                child: Container(
                                  child: RotatedBox(
                                    quarterTurns: 0,
                                    child: SvgPicture.asset(
                                      "assets/icon/arrow.svg",
                                      color: Colors.white,
                                    )
                                  )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),  
                    ),
                    Expanded(
                      child: Container(
                        width: AppData.width.w,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical:12.w),
                          child: SingleChildScrollView(
                            reverse: true,
                            controller: _controller,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: _msgListWidget,
                              // children: [
                                
                              // ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppData.width.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        border:Border(
                          top: BorderSide(width: 4.w, color: Colors.grey[500]),
                        )
                        // color: Colors.red,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppData.width.w-100.w,
                            height: 100.h,
                            child:Padding(
                              padding:  EdgeInsets.only(left: 60.w,right:60.w),
                              child: TextField(
                                style: TextStyle(color: Colors.black, fontSize: 30.sp),
                                controller: _messageController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type something...",
                                  // prefixIcon: Icon(Icons.person_outline),
                                  hintStyle: TextStyle(
                                    fontSize: 30.sp,
                                    // fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    height: 1.1
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onChanged: (value){
                                  // _removeTitleError();
                                },
                                onSubmitted: (val){
                                  _sendMsg();
                                },
                              ),
                            ) ,
                          ),
                          GestureDetector(
                            onTap: (){
                              _sendMsg();
                            },
                            child: Container(
                              width: 100.h,
                              height: 100.h,
                              child: Icon(
                                Icons.send,
                                color: AppColors.mainColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
