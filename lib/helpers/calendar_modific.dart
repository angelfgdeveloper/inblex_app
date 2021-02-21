import 'package:flutter/material.dart';

String dateModific(BuildContext context, String date) {

  List<String> dateAsList = date.split('-');

  final String year = dateAsList[0];
  final String day = dateAsList[2];

  String month = '';

  switch (dateAsList[1]) {
    case '01':
      month = 'Enero';
      break;
    case '02':
      month = 'Febrero';
      break;
    case '03':
      month = 'Marzo';
      break;
    case '04':
      month = 'Abril';
      break;
    case '05':
      month = 'Mayo';
      break;
    case '06':
      month = 'Junio';
      break;
    case '07':
      month = 'Julio';
      break;
    case '08':
      month = 'Agosto';
      break;
    case '09':
      month = 'Septiembre';
      break;
    case '10':
      month = 'Octubre';
      break;
    case '11':
      month = 'Noviembre';
      break;
    case '12':
      month = 'Diciembre';
      break;
  }

  final String newDate = '$day de $month de $year';

  return newDate;
}