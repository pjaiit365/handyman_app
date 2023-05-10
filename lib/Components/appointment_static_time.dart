import 'package:flutter/material.dart';

import '../constants.dart';

class AppointmentStaticTime extends StatefulWidget {
  final String time;
  const AppointmentStaticTime({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<AppointmentStaticTime> createState() => _AppointmentStaticTimeState();
}

class _AppointmentStaticTimeState extends State<AppointmentStaticTime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTimeSelected = !isTimeSelected;
        });
      },
      child: Container(
        height: 34 * screenHeight,
        width: 96 * screenWidth,
        decoration: BoxDecoration(
            color: isTimeSelected ? primary : white,
            borderRadius: BorderRadius.circular(9),
            border: isTimeSelected
                ? null
                : Border.all(color: chatTimeColor, width: 1)),
        child: Center(
          child: Text(
            widget.time,
            style: TextStyle(
              color: isTimeSelected ? white : black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
