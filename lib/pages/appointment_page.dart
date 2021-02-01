import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderTitle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0, 
      runSpacing: 5.0, 
      direction: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                iconSize: 25.0,
                splashRadius: 25.0,
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 10.0,
            ),
            Text('Agendar Cita',
              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ],
    );
  }
}

