import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:inblex_app/helpers/alert_message.dart';
import 'package:inblex_app/services/auth_service.dart';

import 'package:inblex_app/widgets/logo.dart';
import 'package:inblex_app/widgets/custom_input.dart';
import 'package:inblex_app/widgets/button_gradient.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Logo(),
              _Form(),
              _RegisterUser()
            ],
          ),
        ),
      )),
    );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) { 
    final authService = Provider.of<AuthService>(context);
   
    return Container(
      margin: EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
      child: Column(children: [
        CustomInput(
          boxText: 'Email',
          inputAction: TextInputAction.next,
          placeholder: 'you@example.com',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
          autoFocus: true,
        ),
        CustomInput(
          boxText: 'Contraseña',
          inputAction: TextInputAction.done,
          placeholder: 'Ingresa tú contraseña',
          keyboardType: TextInputType.visiblePassword,
          textController: passCtrl,
          isPassword: true,
        ),

        _ForgotPassword(),

        Container(
          width: double.infinity,
          child: ButtonGradient(
            text: 'Ingresar',
            onPressed: authService.auth ? null : () async {

              FocusScope.of(context).unfocus();

              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              if (loginOk) {
                Navigator.pushReplacementNamed(context, 'home');
              } else {
                showAlertMessage(context, 'Inicio de sesión incorrecto', 'Por favor, revise sus credenciales nuevamente');
              }
            },
          ),
        ),
      ]),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 30.0),
          child: Text('¿Olvidaste tú contraseña?',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.blue[600])),
        ),
        onTap: () {
          Navigator.pushNamed(context, 'forgot');
        });
  }
}

class _RegisterUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿Aún no tiene una cuenta?',
              style: TextStyle(fontWeight: FontWeight.w300)),
          SizedBox(width: 10.0),
          GestureDetector(
            child: Text('Regístrate',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushNamed(context, 'register');
            },
          ),
        ],
      ),
    );
  }
}
