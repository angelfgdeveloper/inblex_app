import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:inblex_app/services/list_project_user_service.dart';

import 'package:inblex_app/helpers/calendar_modific.dart';
import 'package:inblex_app/models/sprint_project_response.dart';

showAlertMessageSprints(BuildContext context, int id) {
  final projectUserService =
      Provider.of<ListProjectUserService>(context, listen: false);

  final titleStyle = TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w800);

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
            height: 450.0,
            padding: EdgeInsets.all(18.0),
            child: FutureBuilder(
              future: projectUserService.getSprintProject(id),
              builder: (BuildContext context,
                  AsyncSnapshot<SprintResponse> snapshot) {
                if (snapshot.hasData) {
                  final SprintResponse sprints = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sprints.definicion.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.0),
                      Text('${ dateModific(context, sprints.fechaInicio) } - ${ dateModific(context, sprints.fechaFin) }',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: 16.0),
                      Text('Objetivos', style: titleStyle),
                      SizedBox(height: 5.0),
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        child: ListView.builder(
                          itemCount: sprints.objetivos.length,
                          reverse: false,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text('${sprints.objetivos[i].nombre}'),
                              subtitle: Text('${sprints.objetivos[i].descripcion}', style: TextStyle(), overflow: TextOverflow.ellipsis, maxLines: 3),
                              leading: _status(sprints.objetivos[i].estado),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Progreso', style: titleStyle),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${sprints.progreso}%',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold)),
                              Text('Completado',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 25.0,
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(
                              top: 10.0, right: 0.0, bottom: 2.0),
                          child: OutlineButton(
                              color: Colors.white,
                              textColor: Colors.green,
                              highlightedBorderColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                              child: Text('Aceptar',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)),
                              onPressed: () => Navigator.pop(context)),
                        ),
                      ),
                    ],
                  );
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
            ),
          ),
        )),
  );
}

Widget _status( int status) {
  if (status == 0) {
    return IconButton(
      onPressed: null,
      icon: Icon(
        Icons.pause_circle_outline_outlined,
        color: Colors.red,
        size: 30.0,
      ),
      tooltip: 'Pausado',
    );
  } else if (status == 1) {
    return IconButton(
      onPressed: null,
      icon: Icon(
        Icons.play_circle_outline_outlined,
        color: Colors.blue,
        size: 30.0,
      ),
      tooltip: 'En desarrollo',
    );
  } else if (status == 2) {
    return IconButton(
      onPressed: null,
      icon: Icon(
        Icons.sentiment_very_satisfied,
        color: Colors.green,
        size: 30.0,
      ),
      tooltip: 'Finalizado',
    );
  } else {
    return IconButton(
      onPressed: null,
      icon: Icon(
        Icons.help_outline_outlined,
        color: Colors.grey[300],
        size: 30.0,
      ),
      tooltip: 'Comunicate pronto',
    );
  }
}
