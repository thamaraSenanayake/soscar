import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const.dart';

class TextBox extends StatefulWidget {
  final String textBoxHint;
  final String initText;
  final String prefixIcon;
  final IconData suffixIcon;
  final String textBoxKey;
  final Function(String) onChange;
  final Function(String) onSubmit;
  final bool obscureText;
  final TextInputType textInputType;
  final bool firstLetterCapital;
  final TextEditingController textEditingController;
  final String errorText;
  final FocusNode focusNode;
  final bool shadow;
  final int maxLength;
  TextBox({
    Key key,
    @required this.textBoxKey,
    @required this.onChange,
    this.textBoxHint,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.onSubmit,
    this.suffixIcon, 
    this.initText,
    this.firstLetterCapital = true, 
    this.textEditingController,
    this.focusNode,
    this.shadow = true,
    @required this.errorText, 
    this.maxLength, 
  }) : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  double _width = 0.0;
  TextEditingController _controller;

  @override
  void initState() { 
    super.initState();
    if( widget.textEditingController == null){
      _controller = TextEditingController();
    }else{
      _controller = widget.textEditingController;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      if(widget.initText != null){
        _controller.text = widget.initText;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      _width = MediaQuery.of(context).size.width;
    });
    return Container(
      width: _width - 40,
      constraints: BoxConstraints(
        minHeight: widget.textInputType == TextInputType.multiline? 150:50
      ),
      padding:EdgeInsets.only(
        left:widget.prefixIcon == null ? 20 : 0,
        right:widget.suffixIcon == null? 20 : 0
      ),
      decoration: BoxDecoration(
        // color: widget.errorText.length ==0 ?Colors.white:Colors.redAccent,
        color: Colors.white,
        border: Border.all(
          color: widget.errorText.length ==0?Colors.white:Colors.redAccent,
          width: 3
        ),
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(color:widget.shadow? Color.fromRGBO(0, 0, 0, 0.15):Colors.transparent),
          BoxShadow(
            color: widget.shadow? Color.fromRGBO(0, 0, 0, 0.15):Colors.transparent,
            blurRadius: 11.0,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
      ),
      child: Row(
        children: [
          widget.prefixIcon != null?Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(widget.prefixIcon)
            ),
          ):Container(),
          Container(
            width: widget.prefixIcon == null?(_width -86):(_width -146),
            child: TextField(
              style: TextStyle(
                color: Colors.black, 
                fontSize: 15
              ),
              focusNode: widget.focusNode,
              controller:_controller,
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: widget.textBoxHint,
                hintStyle:TextStyle(fontSize: 14, color: Color(0xffB3A9A9), height: 1.8),
                suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
              ),
              maxLines: widget.textInputType == TextInputType.multiline?null:1,
              obscureText: widget.obscureText,
              keyboardType: widget.textInputType,
              textCapitalization: widget.firstLetterCapital?TextCapitalization.sentences:TextCapitalization.none,
              onChanged: (value) {
                widget.onChange(value);
              },
              onSubmitted: (value) {
                widget.onSubmit(value);
              },
              maxLength: null,
              // maxLengthEnforced: true,
            ),
          ),
        ],
      ),
    );
  }
}