import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inblex_app/models/project_show_response.dart';
// import 'package:flutter/services.dart';

showAlertMessageSprints( BuildContext context, String title, String date, List<Sprint> obj, int porcent ) {

    final titleStyle = TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w800);
    return showDialog(
      context: context,
      builder: ( _ ) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: 500.0,
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 18.0, 
                  fontWeight: FontWeight.w500), 
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.0),
                Text(date, style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400)),
                SizedBox(height: 16.0),
                Text('Objetivos', style: titleStyle),
                SizedBox(height: 5.0),
                Container(
                  width: double.infinity,
                  height: 180.0,
                  child: ListView.builder(
                    itemCount: obj.length,
                    reverse: false,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) {  
                      return ListTile(
                        title: Transform(transform: Matrix4.translationValues(-16, 0.0, 0.0),
                        child: Text('${i + 1} Proident dolor reprehenderit cillum dolore. Proident dolor reprehenderit cillum dolore.')),
                        leading: Icon(Icons.pause_circle_filled, color: Colors.yellow,),
                        onTap: (){},
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
                        Text('$porcent%', style: TextStyle(color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold)),
                        Text('Completado', style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 25.0,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: 10.0, right: 0.0, bottom: 5.0),
                    child: OutlineButton(
                      color: Colors.white,
                      textColor: Colors.green,
                      highlightedBorderColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.transparent
                      ),
                      child: Text('Aceptar', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
                      onPressed: () => Navigator.pop(context)
                    ),
                  ),
                ),
              ],
            ),
          
      ),
        )
      ),
    );

}