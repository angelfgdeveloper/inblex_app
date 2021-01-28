import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:inblex_app/routes/routes.dart';
import 'package:inblex_app/theme/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
        
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'inblexApp',
      initialRoute: 'splashscreen',
      routes: appRoutes,
    );
  }
}