import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  // final IconData icon;
  final String placeholder;
  final String boxText;

  const CustomCalendar({
    @required this.boxText,
    @required this.placeholder 
  });

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  String _fecha = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

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
            controller: _inputFieldDateController,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18.0),
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: this.widget.placeholder,
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate(context);
            },
          )
        )
      ],
    );
  }

   _selectDate(BuildContext context) async {

    DateTime picked = await showRoundedDatePicker(
      theme: ThemeData(primarySwatch: Colors.green),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now().add(Duration(days: 356)),
      borderRadius: 20.0,
      background: Colors.black12,
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      setState(() {
        _fecha = formattedDate;
        _inputFieldDateController.text = _fecha;
      });
    }
  }
    
}
