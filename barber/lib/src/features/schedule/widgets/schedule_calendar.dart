// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  final VoidCallback cancelPressed;
  final ValueChanged<DateTime> okPressed;
  const ScheduleCalendar({
    Key? key,
    required this.cancelPressed,
    required this.okPressed,
  }) : super(key: key);

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime? seleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0XFFE6E2E9),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TableCalendar(
            availableGestures: AvailableGestures.none,
            headerStyle: const HeaderStyle(titleCentered: true),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.now().add(
              const Duration(days: 365 * 10),
            ),
            calendarFormat: CalendarFormat.month,
            locale: 'pt_BR',
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                seleted = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(seleted, day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: ColorsConstants.brow,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: ColorsConstants.brow.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: widget.cancelPressed,
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        color: ColorsConstants.brow,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
              TextButton(
                onPressed: () {
                  if (seleted == null) {
                    Messages.showError('data não informada', context);
                  }
                  widget.okPressed(seleted!);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: ColorsConstants.brow,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
