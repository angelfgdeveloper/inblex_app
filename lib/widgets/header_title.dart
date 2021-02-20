import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {

  final String title;

  const HeaderTitle({
    Key key, 
    @required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
      child: Text(this.title, style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w400)
      )
    );
  }
}