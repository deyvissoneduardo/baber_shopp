import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'appointment_ds.dart';

class EmployeeSchedulePage extends StatelessWidget {
  const EmployeeSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Column(
        children: [
          const Text(
            'Nome',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          Expanded(
            child: SfCalendar(
              allowViewNavigation: true,
              showNavigationArrow: true,
              showDatePickerButton: true,
              showTodayButton: true,
              view: CalendarView.day,
              todayHighlightColor: ColorsConstants.brow,
              onTap: (calendarTapDetails) {
                if (calendarTapDetails.appointments != null &&
                    calendarTapDetails.appointments!.isNotEmpty) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final dateFormat = DateFormat('dd/MM/yyyy H:mm:ss');
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Cliente: ${calendarTapDetails.appointments?.first.subject}'),
                              Text(
                                  'Horario: ${dateFormat.format(calendarTapDetails.date ?? DateTime.now())}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              dataSource: AppointmentDs(),
              appointmentBuilder: (context, calendarAppointmentDetails) {
                return Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: ColorsConstants.brow,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    calendarAppointmentDetails.appointments.first.subject,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
