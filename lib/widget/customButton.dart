import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';

class CustomButton extends StatefulWidget {
  final String imageUrl;
  final String buttonName;
  final Function onTap;
  final bool mainButton;
  final Color backgroundColor;
  final Color textColor;
  CustomButton({Key key,@required this.imageUrl,@required this.buttonName,@required this.onTap, this.mainButton = false, this.backgroundColor = Colors.white ,this.textColor = Colors.black}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height:50,
        decoration: BoxDecoration(
          color:widget.mainButton? AppColors.mainColor:widget.backgroundColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15)),
            BoxShadow(
              color:Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 11.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ],
        ),
        child: Stack(
          children: [
            widget.imageUrl != null? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(widget.imageUrl)
              )
            ):Container(),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.buttonName,
                style:widget.mainButton? TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                  ):TextStyle(
                    color: widget.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
              )
            ),

            widget.mainButton?
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(5.0),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      "assets/icon/arrow.svg",
                      color: Colors.white,
                    )
                  )
                )
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}