import 'package:flutter/material.dart';

import 'package:inblex_app/helpers/alert_message.dart';

import 'package:inblex_app/widgets/custom_input.dart';
import 'package:inblex_app/widgets/button_gradient.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
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
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
                  child: Text('Regístrate', style: TextStyle(fontSize: 26.0))),
              _RadioCompany(),
            ],
          ),
        ),
      )),
    );
  }
}

class _RadioCompany extends StatefulWidget {
  @override
  __RadioCompanyState createState() => __RadioCompanyState();
}

class __RadioCompanyState extends State<_RadioCompany> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                child: _value
                    ? _IconCompany(
                        icon: Icons.check_circle_outline,
                        primaryColor: Colors.green[600],
                        secundaryColor: Colors.white,
                        iconSize: 26.0)
                    : _IconCompany(
                        icon: Icons.circle,
                        primaryColor: Colors.white,
                        secundaryColor: Colors.grey[800],
                        iconSize: 22.0)),
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
          ),
          _FormOrg(_value),
        ],
      ),
    );
  }
}

class _FormOrg extends StatelessWidget {
  final bool value;

  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final rfcCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final streetAddressCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  _FormOrg(this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (!this.value)
            ? _DataPerson(
                nameCtrl: nameCtrl,
                lastNameCtrl: lastNameCtrl,
                rfcCtrl: rfcCtrl,
                emailCtrl: emailCtrl,
                streetAddressCtrl: streetAddressCtrl,
                phoneCtrl: phoneCtrl,
                passCtrl: passCtrl,
                confirmPassCtrl: confirmPassCtrl)
            : _DataOrg(
                nameCtrl: nameCtrl,
                rfcCtrl: rfcCtrl,
                emailCtrl: emailCtrl,
                streetAddressCtrl: streetAddressCtrl,
                phoneCtrl: phoneCtrl,
                passCtrl: passCtrl,
                confirmPassCtrl: confirmPassCtrl),
        Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 25.0),
          child: Column(
            children: [
              Text(
                'Al regístrarse en inblexApp, acepto nuestros',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              GestureDetector(
                child: Text(
                  'Términos y Politicas de Privacidad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  showAlertMessage(context, 'Términos y Politicas de Privacidad', 'Disculpe las molestias, estamos trabajando en su privacidad.');

                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes cuenta?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    child: Text(
                      'Iniciar sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _DataPerson extends StatelessWidget {
  const _DataPerson({
    Key key,
    @required this.nameCtrl,
    @required this.lastNameCtrl,
    @required this.rfcCtrl,
    @required this.emailCtrl,
    @required this.streetAddressCtrl,
    @required this.phoneCtrl,
    @required this.passCtrl,
    @required this.confirmPassCtrl,
  }) : super(key: key);

  final TextEditingController nameCtrl;
  final TextEditingController lastNameCtrl;
  final TextEditingController rfcCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController streetAddressCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController passCtrl;
  final TextEditingController confirmPassCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
      child: Column(
        children: [
          CustomInput(
            boxText: 'Nombre',
            inputAction: TextInputAction.next,
            placeholder: 'Nombre',
            keyboardType: TextInputType.name,
            textController: nameCtrl,
            autoFocus: true,
          ),
          CustomInput(
            boxText: 'Apellido',
            inputAction: TextInputAction.next,
            placeholder: 'Apellido',
            keyboardType: TextInputType.name,
            textController: lastNameCtrl,
          ),
          CustomInput(
            boxText: 'RFC',
            inputAction: TextInputAction.next,
            placeholder: 'RFC',
            keyboardType: TextInputType.text,
            textController: rfcCtrl,
          ),
          CustomInput(
            boxText: 'Email',
            inputAction: TextInputAction.next,
            placeholder: 'you@example.com',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            boxText: 'Domicilio',
            inputAction: TextInputAction.next,
            placeholder: 'Domicilio',
            keyboardType: TextInputType.streetAddress,
            textController: streetAddressCtrl,
          ),
          CustomInput(
            boxText: 'Teléfono',
            inputAction: TextInputAction.next,
            placeholder: 'Teléfono',
            keyboardType: TextInputType.phone,
            textController: phoneCtrl,
          ),
          CustomInput(
            boxText: 'Contraseña',
            inputAction: TextInputAction.next,
            placeholder: 'Ingresa una contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),
          CustomInput(
            boxText: 'Confirmar contraseña',
            inputAction: TextInputAction.done,
            placeholder: 'Confirmar contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: confirmPassCtrl,
            isPassword: true,
          ),
          Container(
            width: double.infinity,
            child: ButtonGradient(
              text: 'Registrarme',
              onPressed: () {
                // TODO: Validar usuario
                FocusScope.of(context).unfocus();
                if (emailCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
                  print(emailCtrl.text);
                  print(passCtrl.text);
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  showAlertMessage(context, 'Registro incorrecto',
                      'Por favor, revise sus credenciales nuevamente');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DataOrg extends StatelessWidget {
  const _DataOrg({
    Key key,
    @required this.nameCtrl,
    @required this.rfcCtrl,
    @required this.emailCtrl,
    @required this.streetAddressCtrl,
    @required this.phoneCtrl,
    @required this.passCtrl,
    @required this.confirmPassCtrl,
  }) : super(key: key);

  final TextEditingController nameCtrl;
  final TextEditingController rfcCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController streetAddressCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController passCtrl;
  final TextEditingController confirmPassCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
      child: Column(
        children: [
          CustomInput(
            boxText: 'Nombre del representante',
            inputAction: TextInputAction.next,
            placeholder: 'Nombre del representante',
            keyboardType: TextInputType.name,
            textController: nameCtrl,
            autoFocus: true,
          ),
          CustomInput(
            boxText: 'RFC',
            inputAction: TextInputAction.next,
            placeholder: 'RFC',
            keyboardType: TextInputType.text,
            textController: rfcCtrl,
          ),
          CustomInput(
            boxText: 'Email',
            inputAction: TextInputAction.next,
            placeholder: 'you@example.com',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            boxText: 'Domicilio fiscal',
            inputAction: TextInputAction.next,
            placeholder: 'Domicilio fiscal',
            keyboardType: TextInputType.streetAddress,
            textController: streetAddressCtrl,
          ),
          CustomInput(
            boxText: 'Teléfono',
            inputAction: TextInputAction.next,
            placeholder: 'Teléfono',
            keyboardType: TextInputType.phone,
            textController: phoneCtrl,
          ),
          CustomInput(
            boxText: 'Contraseña',
            inputAction: TextInputAction.next,
            placeholder: 'Ingresa una contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),
          CustomInput(
            boxText: 'Confirmar contraseña',
            inputAction: TextInputAction.done,
            placeholder: 'Confirmar contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: confirmPassCtrl,
            isPassword: true,
          ),
          Container(
            width: double.infinity,
            child: ButtonGradient(
              text: 'Registrarme',
              onPressed: () {
                // TODO: Validar usuario
                FocusScope.of(context).unfocus();
                if (emailCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
                  print(emailCtrl.text);
                  print(passCtrl.text);
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  showAlertMessage(context, 'Registro incorrecto',
                      'Por favor, revise sus credenciales nuevamente');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCompany extends StatelessWidget {
  final IconData icon;
  final Color primaryColor;
  final Color secundaryColor;
  final double iconSize;

  const _IconCompany({
    @required this.icon,
    @required this.primaryColor,
    @required this.secundaryColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.circle, size: 26.0, color: this.secundaryColor),
              Icon(this.icon, size: this.iconSize, color: this.primaryColor)
            ],
          ),
          SizedBox(width: 10.0),
          Text(
            'Represento a una empresa',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
