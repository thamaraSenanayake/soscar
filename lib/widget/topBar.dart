import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                height: 30,
                width: 30,
                color: Colors.transparent,
                padding: const EdgeInsets.all(5.0),
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
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}