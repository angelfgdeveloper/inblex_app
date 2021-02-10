import 'package:flutter/material.dart';
import 'package:inblex_app/helpers/alert_message.dart';
import 'package:inblex_app/widgets/button_gradient.dart';

import 'package:inblex_app/widgets/custom_input.dart';


class EditDataUserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String name = '';
    String id = '';
    String phone = '';
    String email = '';
    String org = '';
    String reg = '';

    if (arguments != null) {
      name = arguments[1];
      id = arguments[2];
      phone = arguments[3];
      email = arguments[4];
      org = arguments[5];
      reg = arguments[6];
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(top: 25.0, left: 16.0, right: 16.0, bottom: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderTitle(),
                  SizedBox(height: 10.0),
                  Text('Datos Personales', style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
                  _FormDataUser(
                    name: name,
                    id: id,
                    phone: phone,
                    email: email,
                    org: org,
                    reg: reg
                  ),

                ],
              ),
            ),
          ),
        ),
   ),
    );
  }
}

class _FormDataUser extends StatelessWidget {
  final String name;
  final String id;
  final String phone;
  final String email;
  final String org;
  final String reg;

  _FormDataUser({
    this.name,
    this.id,
    this.phone,
    this.email,
    this.org,
    this.reg,
  });

  final nameCtrl = TextEditingController();
  final idCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final orgCtrl = TextEditingController();
  final regCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          CustomInput(
            boxText: 'Nombre de usuario',
            inputAction: TextInputAction.next,
            placeholder: 'Nombre de usuario',
            keyboardType: TextInputType.name,
            textController: nameCtrl..text = this.name,
            autoFocus: false,
          ),
          CustomInput(
            boxText: 'ID del Cliente',
            inputAction: TextInputAction.next,
            placeholder: 'ID del Cliente',
            keyboardType: TextInputType.number,
            textController: idCtrl..text = this.id,
            autoFocus: false,
            isEnableInput: false,
            colorEnableInput: Colors.grey[200],
          ),
          CustomInput(
            boxText: 'Teléfono',
            inputAction: TextInputAction.next,
            placeholder: 'Teléfono',
            keyboardType: TextInputType.phone,
            textController: phoneCtrl..text = this.phone,
          ),
          CustomInput(
            boxText: 'Email',
            inputAction: TextInputAction.next,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl..text = this.email,
            autoFocus: false,
            isEnableInput: false,
            colorEnableInput: Colors.grey[200],
          ),
          CustomInput(
            boxText: 'Empresa',
            inputAction: TextInputAction.next,
            placeholder: 'Empresa',
            keyboardType: TextInputType.text,
            textController: orgCtrl..text = this.org,
          ),
          CustomInput(
            boxText: 'Regimen',
            inputAction: TextInputAction.next,
            placeholder: 'Regimen',
            keyboardType: TextInputType.emailAddress,
            textController: regCtrl..text = this.reg,
            autoFocus: false,
            isEnableInput: false,
            colorEnableInput: Colors.grey[200],
          ),
          ButtonGradient(text: 'Guardar cambios', onPressed: () {
            if ((nameCtrl.text.isNotEmpty && this.name != nameCtrl.text) || (phoneCtrl.text.isNotEmpty && this.phone != phoneCtrl.text) || (orgCtrl.text.isNotEmpty && this.org != orgCtrl.text)) {
              // TODO: Modificación de datos
              Navigator.pop(context);
            } else {
              showAlertMessage(context, 'Datos de Usuario', 'No se genero ningun cambio en los datos');
            }
          })
        ],
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0, 
      runSpacing: 5.0, 
      direction: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                iconSize: 25.0,
                splashRadius: 25.0,
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 10.0,
            ),
            Text('Editar Datos',
              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ],
    );
  }
}
