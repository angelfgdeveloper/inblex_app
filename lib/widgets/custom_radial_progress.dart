import 'package:flutter/material.dart';
import 'package:inblex_app/widgets/radial_progress.dart';

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  final double porcent;
  final double grosorPrimary;
  final double grosorSecundary;
  final double textSize;

  const CustomRadialProgress ({
    @required this.porcent,
    @required this.color, 
    this.grosorPrimary = 6.0, 
    this.grosorSecundary = 5.0, 
    this.textSize = 10.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        child: Stack(
      alignment: Alignment.center,
      children: [
        RadialProgress(
          porcentaje: porcent,
          colorPrimario: this.color,
          colorSecundario: Colors.green[100],
          grosorPrimario: this.grosorPrimary,
          grosorSecundario: this.grosorSecundary,
        ),
        Text(
          '$porcent %',
          style: TextStyle(fontSize: this.textSize, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}