import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlertMessageEvent(BuildContext context, String title, String date,
    String hour, String affair, String status) {
  return showDialog(
    context: context,
    builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: 280.0,
            padding: EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20.0),
                _InfoEvent(title: 'Fecha:', data: date),
                SizedBox(height: 10.0),
                _InfoEvent(title: 'Hora:', data: hour),
                SizedBox(height: 15.0),
                _Affair(title: 'Asunto:', data: affair),
                SizedBox(height: 15.0),
                _InfoEvent(title: 'Estado:', data: status),
                _Buttons(),
              ],
            ),
          ),
        )),
  );
}

class _InfoEvent extends StatelessWidget {
  final String title;
  final String data;

  const _InfoEvent({
    @required this.title,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            this.title,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 4.0),
          Expanded(
            child: Text(
              this.data,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

class _Affair extends StatelessWidget {
  final String title;
  final String data;

  const _Affair({
    @required this.title,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4.0),
        Text(
          this.data,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          maxLines: 4,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.black54,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 20.0,
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _FlatButton(
              text: 'Posponer', 
              color: Colors.red, 
              onPressed: () {}),
            _FlatButton(
                text: 'Aceptar',
                color: Colors.green,
                onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}

class _FlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const _FlatButton(
      {@required this.text, @required this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.white,
        minWidth: 60.0,
        textColor: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
        onPressed: onPressed);
  }
}
