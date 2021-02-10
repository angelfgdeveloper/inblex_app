import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inblex_app/models/get_hour_model.dart';
import 'package:provider/provider.dart';

showAlertMessageSchedule(
    BuildContext context, String title, List<String> schedule) {
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
            height: 350.0,
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
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0),
                _InfoEvent(schedule: schedule),
                _Buttons(),
              ],
            ),
          ),
        )),
  );
}

// ignore: must_be_immutable
class _InfoEvent extends StatefulWidget {
  List<String> schedule;
  String _singleValue;

  _InfoEvent({
    @required this.schedule,
  });

  @override
  __InfoEventState createState() => __InfoEventState();
}

class __InfoEventState extends State<_InfoEvent> {
  @override
  Widget build(BuildContext context) {

    final hourProvider = Provider.of<HourModel>(context);

    return Container(
      width: double.infinity,
      height: 265.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.schedule.length,
          itemBuilder: (context, i) {
            return Table(
              // border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: FractionColumnWidth(.52),
              children: [
                TableRow(children: [
                  Text(widget.schedule[i],
                      style: TextStyle(
                          color: (widget.schedule[i] == widget.schedule[3]) ||
                                  (widget.schedule[i] == widget.schedule[4]) ||
                                  (widget.schedule[i] == widget.schedule[5])
                              ? Colors.grey
                              : Colors.black,
                          fontSize: 16.0)),
                  RadioListTile(
                    title: (widget.schedule[i] == widget.schedule[3]) ||
                            (widget.schedule[i] == widget.schedule[4]) ||
                            (widget.schedule[i] == widget.schedule[5])
                        ? Text('No Disponible',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0))
                        : Text('Disponible',
                            style: TextStyle(
                                color: Colors.black, fontSize: 15.0)),
                    value: widget.schedule[i],
                    dense: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.green,
                    groupValue: hourProvider.hourSelected.isNotEmpty ? this.widget._singleValue = hourProvider.hourSelected : this.widget._singleValue,
                    onChanged: (widget.schedule[i] == widget.schedule[3]) ||
                            (widget.schedule[i] == widget.schedule[4]) ||
                            (widget.schedule[i] == widget.schedule[5])
                        ? null
                        : (value) {
                            setState(() {
                              this.widget._singleValue = value;
                              hourProvider.hourSelected = value;
                            });
                          },
                  ),
                ]),
              ],
            );
          }),
    );
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hourProvider = Provider.of<HourModel>(context);
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 20.0,
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _FlatButton(
                text: 'Cancelar',
                color: Colors.red,
                onPressed: () {
                  hourProvider.hourSelected = '';
                  Navigator.pop(context);
                }),
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