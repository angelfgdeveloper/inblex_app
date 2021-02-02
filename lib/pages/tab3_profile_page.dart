import 'package:flutter/material.dart';

import 'package:inblex_app/widgets/button_gradient.dart';
import 'package:inblex_app/widgets/button_red.dart';

class Tab3ProfilePage extends StatelessWidget {
  final bool _avatar = true;

  final Map<int, String> dataUser = {

    1: 'Empresa',
    2: '165146849852',
    3: '618502216',
    4: 'test_company@test.com',
    5: 'Apple Computer',
    6: 'Persona Moral'

  };

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
                  _Avatar(avatarUser: _avatar),
                  Text(
                    'Empresa',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 18.0),
                  Divider(
                    color: Colors.black26,
                    height: 1.5,
                  ),
                  SizedBox(height: 20.0),
                  _InfoUser(title: 'Nombre de usuario', data: dataUser[1]),
                  _InfoUser(title: 'ID del Cliente', data: dataUser[2]),
                  _InfoUser(title: 'Teléfono', data: dataUser[3]),
                  _InfoUser(title: 'Email', data: dataUser[4]),
                  _InfoUser(title: 'Empresa', data: dataUser[5]),
                  _InfoUser(title: 'Regimen', data: dataUser[6]),

                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.only(right: 40.0, left: 40.0),
                    child: ButtonGradient(text: 'Editar datos', onPressed: () {
                      Navigator.pushNamed(context, 'edit', arguments: dataUser);
                    }),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 40.0, left: 40.0),
                    child: ButtonRed(text: 'Cerrar sesión', onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    }),
                  ),
                  SizedBox(height: 20.0),
                  
                ],
              ),
            )),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final bool avatarUser;

  _Avatar({@required this.avatarUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: CircleAvatar(
        backgroundColor: Colors.green[400],
        radius: 70.0,
        child: this.avatarUser
            ? Text('Ap',
                style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center)
            : Icon(Icons.person, color: Colors.white, size: 85.0),
      ),
    );
  }
}

class _InfoUser extends StatelessWidget {
  final String title;
  final String data;

  const _InfoUser({
    @required this.title,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.0, left: 25.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          Text(
            this.data,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
