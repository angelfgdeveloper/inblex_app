import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:inblex_app/helpers/alert_message_schedule.dart';

import 'package:inblex_app/models/get_hour_model.dart';

import 'package:inblex_app/widgets/button_gradient.dart';
import 'package:inblex_app/widgets/custom_calendar.dart';
import 'package:inblex_app/widgets/custom_input.dart';
import 'package:inblex_app/widgets/custom_schedule.dart';
import 'package:inblex_app/widgets/dropdown_button.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<String> menu = [
    'Costos y cotización de un proyecto',
    'Información sobre mi proyecto',
    'Cambios en mi proyecto',
    'Avances de mi proyecto',
    'Servicios de la empresa',
    'Otro'
  ];

  String selectedMenu;

  @override
  Widget build(BuildContext context) {
    final hourProvider = Provider.of<HourModel>(context);

    final affairCtrl = TextEditingController();
    final scheduleCtrl = TextEditingController();

    if (hourProvider.hourSelected.isNotEmpty) {
      setState(() {
        scheduleCtrl.text = hourProvider.hourSelected;
      });
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
              padding: EdgeInsets.only(
                  top: 25.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderTitle(),
                  _DropDownButton(
                      menu: menu,
                      selectedMenu: selectedMenu,
                      onChange: (newValue) {
                        setState(() {
                          selectedMenu = newValue;
                        });
                      }),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                    child: CustomInput(
                      boxText: 'Asunto',
                      inputAction: TextInputAction.next,
                      placeholder: 'Asunto',
                      textController: affairCtrl,
                      isMinLine: 1,
                      isMaxLine: 3,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                    child: CustomCalendar(
                      boxText: 'Elegir fecha',
                      placeholder: 'Elegir fecha',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                    child: CustomSchedule(
                      boxText: 'Horario',
                      placeholder: 'Horario',
                      textController: scheduleCtrl,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        List<String> schedule = [
                          '10:00 - 11:00 AM',
                          '11:00 - 12:00 PM',
                          '12:00 - 01:00 PM',
                          '01:00 - 02:00 PM',
                          '02:00 - 03:00 PM',
                          '03:00 - 04:00 PM',
                          '04:00 - 05:00 PM',
                          '05:30 - 06:00 PM',
                        ];
                        return showAlertMessageSchedule(
                            context, 'Horario', schedule);
                      },
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                      child: ButtonGradient(text: 'Enviar', onPressed: () {})),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropDownButton extends StatelessWidget {
  final List<String> menu;
  final String selectedMenu;
  final Function onChange;

  const _DropDownButton({
    @required this.menu,
    @required this.selectedMenu,
    @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      child: DropDownButton(
          menu: menu,
          selectedMenu: selectedMenu,
          textBox: 'Temas de la reunión',
          placeHolder: 'Temas de la reunión',
          onChange: this.onChange),
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
                  final hourProvider =
                      Provider.of<HourModel>(context, listen: false);
                  hourProvider.hourSelected = '';
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 10.0,
            ),
            Text('Agendar Cita',
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
