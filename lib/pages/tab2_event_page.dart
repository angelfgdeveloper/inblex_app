import 'package:flutter/material.dart';
import 'package:inblex_app/helpers/alert_message.dart';

class Tab2EventPage extends StatefulWidget {
  @override
  _Tab2EventPageState createState() => _Tab2EventPageState();
}

class _Tab2EventPageState extends State<Tab2EventPage> {
  List<String> event = [
    'Cambios en mi proyecto',
    'Cambios en mi proyecto 2',
    'Cambios en mi proyecto 3',
  ];

  final List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.red,
  ];

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
          child: Column(
            children: [
              _HeaderTitle(),
              _ListEvents(event, colors),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add, size: 45),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF6C8AE6), Color(0xFF0EFF97)],
              )),
        ),
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, 'appointment');
          });
        },
      ),
    ));
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin:
            EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: Text('Eventos',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w400)));
  }
}

class _ListEvents extends StatelessWidget {
  final List<String> event;
  final List<Color> color;

  _ListEvents(this.event, this.color);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:
            const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: event.length,
        itemBuilder: (context, i) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (DismissDirection direction) {
              // TODO: Eliminar evento agendado
              event.removeAt(i);
            },
            confirmDismiss: (direction) {
              return Future.value(direction == DismissDirection.endToStart);
            },
            background: Container(
            padding: EdgeInsets.only(right: 20.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.red,
            child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete, color: Colors.white))),
            child: _ListTitle(event[i], color[i])
          );
        });
  }
}

class _ListTitle extends StatelessWidget {
  final String event;
  final Color color;

  _ListTitle(this.event, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
                  Text("Diciembre".toUpperCase(),
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 14.0),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 2.0),
                  Text("12",
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
                    Text(event,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 6.0),
                    Text("15:00",
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
      ),
      onTap: () {
        showAlertMessage(context, event, 'Fecha: 12 de Diciembre de 2021');
      },
    );
  }
}
