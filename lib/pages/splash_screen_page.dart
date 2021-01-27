import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:inblex_app/pages/home_page.dart';
import 'package:inblex_app/pages/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {

    redirectLoadingUser();

    super.initState();
  }

  redirectLoadingUser() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text('inblex',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Future redirectUser(BuildContext context) async {
    final milliseconds = 2000;

    final userAuth = false;

    if (userAuth) {
      await Future.delayed(Duration(milliseconds: milliseconds));

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionDuration: Duration(milliseconds: milliseconds),
          ));
    } else {
      await Future.delayed(Duration(milliseconds: milliseconds));

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: milliseconds)));
    }
  }
}

// return Scaffold(
//       body: FutureBuilder(
//         future: redirectUser(context),
//         builder: (context, snapshot) {
//           return Container();
//         },
//       ),
//     );
