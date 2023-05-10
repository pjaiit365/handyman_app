import 'package:flutter/material.dart';

import '../constants.dart';

class AppointmentButton extends StatelessWidget {
  final String text;
  final Color containerColor;
  final Color textColor;
  final VoidCallback press;
  const AppointmentButton({
    Key? key,
    required this.text,
    required this.containerColor,
    required this.textColor,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 44 * screenHeight,
        width: 181 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: containerColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
