import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  // final IconData icon;
  final String placeholder;
  final String boxText;
  final TextEditingController textController;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool autoFocus;
  final bool isEnableInput;
  final Color colorEnableInput;
  final int isMinLine;
  final int isMaxLine;

  const CustomInput({
    @required this.boxText,
    @required this.placeholder,
    @required this.textController,
    @required this.inputAction,
    this.keyboardType = TextInputType.text,
    this.isPassword = false, this.autoFocus = false, this.isEnableInput = true, this.colorEnableInput = Colors.white, 
    this.isMinLine = 1, this.isMaxLine = 1
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 2.0),
          child: Text(this.boxText, style: TextStyle(fontWeight: FontWeight.w300))
        ),
        SizedBox(height: 1.0),
        Container(
          width: double.infinity,
          height: this.isMaxLine == 3 ? this.isMaxLine * 25.0 : 50,
          padding:EdgeInsets.only(top: 1.0, right: 5.0, left: 5.0, bottom: 0.0),
          margin: EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
            color: this.colorEnableInput,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 5),
                  spreadRadius: 1.0,
                  blurRadius: 3.0)
            ],
          ),
          child: TextField(
            autofocus: this.autoFocus,
            controller: this.textController,
            autocorrect: false,
            minLines: this.isMinLine,
            maxLines: this.isMaxLine,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18.0),
            textInputAction: this.inputAction,
            keyboardType: this.keyboardType,
            obscureText: this.isPassword,
            enabled: this.isEnableInput,
            decoration: InputDecoration(
              // prefixIcon: Icon(this.icon),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeholder,
            ),
          ),
        ),
      ],
    );
  }
}
