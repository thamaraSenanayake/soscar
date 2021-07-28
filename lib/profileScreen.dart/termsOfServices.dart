import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfServices extends StatefulWidget {
  TermsOfServices({Key key}) : super(key: key);

  @override
  _TermsOfServicesState createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          "Terms of Service",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 20
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            color: AppColors.mainColor,
            padding:  EdgeInsets.all(30.h),
            child: SvgPicture.asset(
              "assets/icon/arrow.svg",
              color:Colors.white,
            )
          ),
        ),
        
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top:50),
        child:AnimationLimiter(
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
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Magna magna et qui dolor amet. Dolore cillum pariatur consectetur ullamco aliquip eiusmod duis laboris nostrud elit pariatur ad nisi do. Reprehenderit sint eiusmod cillum velit ex aliqua irure qui."+ 
                  "Eu do aute laborum nisi nisi occaecat duis consectetur minim. Et dolor exercitation velit ut ut aliqua sit pariatur qui occaecat non pariatur. Sit et esse eiusmod labore commodo et sit mollit amet in cupidatat velit.",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.justify,

                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}