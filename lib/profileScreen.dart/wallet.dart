import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/widget/customButton.dart';
import '../const.dart';

class Wallet extends StatefulWidget {
  Wallet({Key key}) : super(key: key);

  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height:AppData.height.h -160.h,
        width:AppData.width.w,
        color: Colors.white,
        padding: EdgeInsets.only(top:250.h),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 250.h,
                width: 250.h,
                child: SvgPicture.asset(
                  "assets/images/wallet.svg"
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top:350.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "You have \$ 100.00 \n in your wallet",
                  style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 450.h,
                child: Column(
                  children: [
                    CustomButton(
                      imageUrl: null, 
                      buttonName: "Topup Cash ", 
                      onTap: (){},
                      mainButton: true,
                    ),

                    SizedBox(
                      height: 50.h,
                    ),

                    CustomButton(
                      imageUrl: null, 
                      buttonName: "Withdraw Cash ", 
                      onTap: (){},
                      mainButton: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}