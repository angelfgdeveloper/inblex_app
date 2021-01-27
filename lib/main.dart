import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:inblex_app/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
        
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Colors.green[400],
        textSelectionColor: Colors.green[200],
        textSelectionHandleColor: Colors.green[400], 
      ),
      title: 'inblexApp',
      initialRoute: 'splashscreen',
      routes: appRoutes,
    );
  }
}