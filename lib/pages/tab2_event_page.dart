import 'package:flutter/material.dart';
import 'package:inblex_app/helpers/alert_message.dart';
import 'package:inblex_app/helpers/calendar_modific.dart';
import 'package:provider/provider.dart';

import 'package:inblex_app/services/diary_user_service.dart';
import 'package:inblex_app/helpers/alert_message_event.dart';
import 'package:inblex_app/models/get_list_diary_response.dart';

import 'package:inblex_app/widgets/header_title.dart';
import 'package:inblex_app/widgets/list_title_diary_project_user.dart';

class Tab2EventPage extends StatefulWidget {

  @override
  _Tab2EventPageState createState() => _Tab2EventPageState();
}

class _Tab2EventPageState extends State<Tab2EventPage> {
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
               HeaderTitle(title: 'Eventos'),
              _ListEvents(),
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

class _ListEvents extends StatelessWidget {

  final List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.blueGrey,
    Colors.orange,
    Colors.black26,
    Colors.yellowAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final diary = Provider.of<DiaryUserService>(context);
    return FutureBuilder(
      future: diary.getListDairyUser(),
      builder: (BuildContext context, AsyncSnapshot<List<ListDiaryResponse>> snapshot) {

        if ( snapshot.hasData ) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              ListDiaryResponse diaryResponse = snapshot.data[i];
              return GestureDetector(
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) {
                    showAlertMessageDelete(context, 'Eliminar evento', '¿Desea eliminar realmente el evento?', () {
                      final dairy = Provider.of<DiaryUserService>(context, listen: false);
                      dairy.deleteDairyUser(diaryResponse.id);
                      Navigator.pop(context);
                    }, () {
                        Navigator.pop(context);
                    });
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
                  child: ListTitleDiary(diary: diaryResponse, color: colors[i * 3])
                ),
                onTap: () {
                  showAlertMessageEvent(
                    context, 
                    diaryResponse.temaCita.tema,
                    dateModific(context, diaryResponse.fecha),
                    diaryResponse.hora.substring(0, 5),
                    diaryResponse.contenido,
                    'Pendiente??'
                  );
                },
              );
            });
          
        } else {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}