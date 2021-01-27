import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {

  final String text;
  final Function onPressed;

  const ButtonGradient({
    Key key, 
    @required this.text, 
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        elevation: 2.0,
        highlightElevation: 5.0,
        color: Colors.blue,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: this.onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFF6C8AE6),
                Color(0xFF0EFF97)
              ],
            ),
          ),
          height: 42.0,
          child: Center(
              child: Text(this.text,
                  style: TextStyle(color: Colors.white, fontSize: 18.0))),
        ),
      ),
    );
  }
}