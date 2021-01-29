import 'package:flutter/material.dart';
import 'package:inblex_app/pages/tab1_home_page.dart';
import 'package:inblex_app/pages/tab2_event_page.dart';
import 'package:inblex_app/pages/tab3_profile_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _NavegationModel(),
      child: Scaffold(
        body: _Pages(),
       bottomNavigationBar: _Navigation(),
   ),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navegationModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1HomePage(),
        Tab2EventPage(),
        Tab3ProfilePage()
      ],
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return BottomNavigationBar(
      elevation: 2.0,
      currentIndex: navegationModel.pageActual,
      onTap: (i) => navegationModel.pageActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.event_available), label: 'Eventos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}

class _NavegationModel with ChangeNotifier {

  int _pageActual = 0;
  PageController _pageController = new PageController();

  int get pageActual => this._pageActual;
  set pageActual(int valor){
    this._pageActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}