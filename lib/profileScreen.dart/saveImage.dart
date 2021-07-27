import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soscar/const.dart';

class SaveImage extends ModalRoute<void> {
  final SaveImageListener listener;

  SaveImage({@required this.listener});

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Material(
      type: MaterialType.transparency,
      child: _buildOverlayContent(context),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(),
          Container(
            height: 442.h,
            width: AppData.width.w,
            child: Padding(
              padding:  EdgeInsets.all(40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          listener.imageSelectType(ImageSelectType.Gallery);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 100.h,
                          width: (AppData.width.w -100.w),
                          child: Center(
                            child: Text(
                              'Open gallery',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(20.r),
                              topRight:Radius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: (AppData.width.w -100.w),
                        height: 2.h,
                        color: Colors.blueGrey,
                      ),
                      GestureDetector(
                        onTap: (){
                          listener.imageSelectType(ImageSelectType.Camera);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 100.h,
                          width: (AppData.width.w -100.w),
                          child: Center(
                            child: Text(
                              'Open camera',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft:Radius.circular(20.r),
                              bottomRight:Radius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 100.h,
                      width: (AppData.width.w -100.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20.r
                        )
                      ),
                      child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color:  Colors.black,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween(
            begin: Offset(0.0, 1.0),
            end: Offset(0.0, 0.0))
        .animate(animation),
        child:child,
      // child: ScaleTransition(
      //   scale: animation,
      //   child: child,
      // ),
    );
  }
}

enum ImageSelectType{
  Gallery,
  Camera
}
abstract class SaveImageListener{
  imageSelectType(ImageSelectType imageSelectType);
}