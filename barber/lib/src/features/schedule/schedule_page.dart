import 'package:barber/src/core/ui/barbershop_icons.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/form_helper.dart';
import 'package:barber/src/core/ui/helpers/messages.dart';
import 'package:barber/src/core/ui/widgets/avatar_widget.dart';
import 'package:barber/src/core/ui/widgets/hours_panel.dart';
import 'package:barber/src/features/schedule/widgets/schedule_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var dateFormt = DateFormat('dd/MM/yyyy');
  var showCalendar = false;
  final formKey = GlobalKey<FormState>();
  final clientEC = TextEditingController();
  final dateEC = TextEditingController();

  @override
  void dispose() {
    clientEC.dispose();
    dateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cliente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const AvatarWidget(hideUploadButton: true),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Nome Sobrenome',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  TextFormField(
                    controller: clientEC,
                    validator: Validatorless.required('obrigatorio'),
                    decoration: const InputDecoration(label: Text('Cliente')),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: dateEC,
                    validator: Validatorless.required('obrigatorio'),
                    onTap: () {
                      setState(() {
                        showCalendar = !showCalendar;
                      });
                      context.unfocus();
                    },
                    decoration: const InputDecoration(
                        label: Text('Selecione um data'),
                        hintText: 'Selecione um data',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        suffixIcon: Icon(
                          BarbershopIcons.calendar,
                          size: 18,
                          color: ColorsConstants.brow,
                        )),
                  ),
                  Offstage(
                    offstage: !showCalendar,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        ScheduleCalendar(
                          cancelPressed: () {
                            setState(() {
                              showCalendar = !showCalendar;
                            });
                          },
                          okPressed: (value) {
                            setState(() {
                              dateEC.text = dateFormt.format(value);
                              showCalendar = !showCalendar;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HoursPanel.singleSelection(
                    startTime: 6,
                    endTime: 23,
                    onHourPressed: (value) {},
                    enabledTimes: const [6, 7, 8],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (formKey.currentState?.validate()) {
                        case null || false:
                          Messages.showError('invalido', context);
                        case true:
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56)),
                    child: const Text('Agendar'),
                  ),
                  const SizedBox(
                    height: 20,
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
