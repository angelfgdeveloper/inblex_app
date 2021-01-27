import 'package:flutter/material.dart';

import 'package:inblex_app/widgets/custom_input.dart';
import 'package:inblex_app/widgets/button_gradient.dart';

class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('Recupera tu cuenta', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Text('Ingresa un correo electrónico válido', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300))),
                _Form(),
              ],
            ),
          ),
        ),
      ),
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
            inputAction: TextInputAction.next,
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
              }
           )),
        ],
      ),
    );
  }
}