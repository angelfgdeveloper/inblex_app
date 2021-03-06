import 'package:flutter/material.dart';
import 'package:inblex_app/helpers/calendar_modific.dart';
import 'package:inblex_app/models/get_list_diary_response.dart';

class ListTitleDiary extends StatelessWidget {

  final ListDiaryResponse diary;
  final Color color;

  ListTitleDiary({
    @required this.diary,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0, left: 10.0),
      // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey[400],
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 5.0))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 7.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: this.color),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getMonth(context, diary.fecha).toUpperCase(),
                    style:
                        TextStyle(color: Colors.grey[400], fontSize: 14.0),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis),
                SizedBox(height: 2.0),
                Text(getDayNumb(context, diary.fecha),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(diary.temaCita.tema,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 6.0),
                  Text(diary.hora.substring(0, 5),
                      style: TextStyle(
                          color: Colors.grey[400], fontSize: 14.0),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.info_outline,
              color: Colors.grey,
              size: 28.0,
            ),
          )
        ],
      ),
    );
  }
}
