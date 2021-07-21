import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final String imageUrl;
  final String buttonName;
  CustomButton({Key key,@required this.imageUrl,@required this.buttonName}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height:50,
      decoration: BoxDecoration(
        color: Colors.white,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(widget.imageUrl)
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.buttonName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            )
          )
        ],
      ),
    );
  }
}