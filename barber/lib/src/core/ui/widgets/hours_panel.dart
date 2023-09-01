// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:flutter/material.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;

  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione horarios de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = startTime; i <= endTime; i++)
              TimeButton(label: '${i.toString().padLeft(2, '0')}:00')
          ],
        )
      ],
    );
  }
}

class TimeButton extends StatefulWidget {
  final String label;

  const TimeButton({
    super.key,
    required this.label,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: ColorsConstants.gray,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 12,
              color: ColorsConstants.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
