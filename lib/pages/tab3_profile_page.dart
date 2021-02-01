import 'package:flutter/material.dart';

class Tab3ProfilePage extends StatelessWidget {
  final bool _avatar = true;

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
                  _InfoUser(title: 'Nombre de usuario', data: 'Empresa'),
                  _InfoUser(title: 'ID del Cliente', data: '165146849852'),
                  _InfoUser(title: 'Teléfono', data: '618502216'),
                  _InfoUser(title: 'Email', data: 'test_company@test.com'),
                  _InfoUser(title: 'Empresa', data: 'Apple Computer'),
                  _InfoUser(title: 'Regime', data: 'Persona Moral'),
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
      margin: EdgeInsets.only(right: 25.0, left: 25.0, bottom: 15.0),
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
