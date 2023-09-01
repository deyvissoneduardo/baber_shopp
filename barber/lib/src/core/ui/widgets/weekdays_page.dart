// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPage extends StatelessWidget {
  const WeekdaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecione os dias da Semana',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDay(label: 'Seg'),
                ButtonDay(label: 'Ter'),
                ButtonDay(label: 'Qua'),
                ButtonDay(label: 'Qui'),
                ButtonDay(label: 'Sex'),
                ButtonDay(label: 'Sab'),
                ButtonDay(label: 'Dom'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonDay extends StatelessWidget {
  final String label;
  const ButtonDay({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(3),
          width: 40,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorsConstants.grayLigth,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: ColorsConstants.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
