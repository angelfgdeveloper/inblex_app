import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownButton extends StatelessWidget {
  List<String> menu;
  String selectedMenu;
  Function onChange;
  String textBox;
  String placeHolder;
  Color iconEnabledColor;

  DropDownButton(
      {@required this.menu,
      @required this.selectedMenu,
      @required this.onChange,
      @required this.textBox,
      @required this.placeHolder,
      this.iconEnabledColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 2.0),
            child: Text(this.textBox,
                style: TextStyle(fontWeight: FontWeight.w300))),
        SizedBox(height: 2.0),
        Container(
            padding:EdgeInsets.only(top: 1.0, right: 5.0, left: 5.0, bottom: 0.0),
            margin: EdgeInsets.only(bottom: 15.0),
            height: 50.0,
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
            child: DropdownButton(
              value: this.selectedMenu,
              isExpanded: true,
              elevation: 2,
              underline: Container(
                color: Colors.transparent,
              ),
              iconEnabledColor: this.iconEnabledColor,
              items: this.menu.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value,
                      style: TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 18.0)),
                );
              }).toList(),
              hint: Text(this.placeHolder,
                  style:
                      TextStyle(fontWeight: FontWeight.w200, fontSize: 18.0)),
              onChanged: this.onChange,
            )),
      ],
    );
  }
}
