import 'package:flutter/material.dart';

class ButtonRed extends StatelessWidget {

  final String text;
  final Function onPressed;

  const ButtonRed({
    @required this.text, 
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        elevation: 2.0,
        highlightElevation: 5.0,
        color: Colors.white,
        textColor: Colors.red,
        highlightColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.red,
            style: BorderStyle.solid
          )
        ),
        onPressed: this.onPressed,
        child: Center(
              child: Text(this.text,
                  style: TextStyle(fontSize: 18.0))),
        ),
     
    );
  }
}