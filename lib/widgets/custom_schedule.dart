import 'package:flutter/material.dart';

class CustomSchedule extends StatefulWidget {
  final String placeholder;
  final String boxText;
  final TextEditingController textController;
  final Function onTap;

  const CustomSchedule({
    @required this.boxText,
    @required this.placeholder, 
    @required this.textController, 
    @required this.onTap 
  });

  @override
  _CustomScheduleState createState() => _CustomScheduleState();
}

class _CustomScheduleState extends State<CustomSchedule> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 2.0),
          child: Text(this.widget.boxText, style: TextStyle(fontWeight: FontWeight.w300))
        ),
        SizedBox(height: 1.0),
        Container(
          width: double.infinity,
          height: 50,
          padding:EdgeInsets.only(top: 1.0, right: 5.0, left: 5.0, bottom: 0.0),
          margin: EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
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
            enableInteractiveSelection: false,
            controller: this.widget.textController,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18.0),
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: this.widget.placeholder,
            ),
            onTap: this.widget.onTap,
          )
        )
      ],
    );
  }
    
}
