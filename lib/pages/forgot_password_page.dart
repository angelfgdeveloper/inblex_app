import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:inblex_app/helpers/alert_message.dart';

import 'package:inblex_app/widgets/custom_input.dart';
import 'package:inblex_app/widgets/button_gradient.dart';

class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _HeaderTitle(),
                  SizedBox(height: 10.0),
                  Center(child: Text('Ingresa un correo electrónico válido', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300))),
                  _Form(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10.0),
        IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            iconSize: 25.0,
            splashRadius: 25.0,
            onPressed: () {
              Navigator.pop(context);
            }),
        SizedBox(width: 10.0),
        Text('Recupera tu cuenta',
          overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
      child: Column(
        children: [
          CustomInput(
            boxText: 'Email',
            inputAction: TextInputAction.done,
            placeholder: 'you@example.com',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
            autoFocus: true,
          ),

          Container(
            width: double.infinity,
            child: ButtonGradient(
              text: 'Recupera tu contraseña',
              onPressed: () {
                // TODO: Válidar contraseña olvidada
                showAlertMessage(context, 'Recuperar cuenta', 'Disculpe las molestias, opción no válida por el momento.');
              }
           )),
        ],
      ),
    );
  }
}