import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 150.0,
            margin: EdgeInsets.only(top: 25.0),
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/inblex_splash.png'), fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Divider(height: 0, color: Colors.grey[300], thickness: 1.0),
        SizedBox(height: 12.0),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Conoce el estado de tú\nproyecto, solicita cambios y\nmás.', 
          style: TextStyle( 
            fontSize: 22.0,
            fontWeight: FontWeight.w400
          )
        )),
      ],
    );
  }
}