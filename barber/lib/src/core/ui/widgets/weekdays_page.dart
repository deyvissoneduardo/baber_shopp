// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPage extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  const WeekdaysPage({
    Key? key,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione os dias da Semana',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDay(
                  label: 'Seg',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Ter',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Qua',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Qui',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Sex',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Sab',
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Dom',
                  onDayPressed: onDayPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDayPressed;
  const ButtonDay({
    Key? key,
    required this.label,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.gray;
    var buttonColor = selected ? ColorsConstants.brow : Colors.white;
    var buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.gray;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          widget.onDayPressed(widget.label);
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(3),
          width: 40,
          height: 56,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: buttonBorderColor,
            ),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
