import 'package:flutter/material.dart';

import '../constants.dart';

class AppointmentDate extends StatefulWidget {
  final int index;
  final String day;
  final String date;
  const AppointmentDate({
    Key? key,
    required this.day,
    required this.date,
    required this.index,
  }) : super(key: key);

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.day,
          style: TextStyle(
              color: textGreyColor, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 11),
        GestureDetector(
          onTap: () {
            setState(() {
              isDateSelected = !isDateSelected;
            });
          },
          child: Container(
            height: 38 * screenHeight,
            width: 38 * screenWidth,
            decoration: BoxDecoration(
              color: isDateSelected ? primary : white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
              child: Text(
                widget.date,
                style: TextStyle(
                  color: isDateSelected ? white : black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
