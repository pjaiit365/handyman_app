import 'package:flutter/material.dart';

import '../constants.dart';

class DashboardTab extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  const DashboardTab({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48 * screenHeight,
      width: 112 * screenWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
