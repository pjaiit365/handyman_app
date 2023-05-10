import 'package:flutter/material.dart';

import '../constants.dart';

class DashboardTab extends StatefulWidget {
  final String text;
  const DashboardTab({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDashboardTabSelected = !isDashboardTabSelected;
        });
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 112 * screenWidth),
        height: 48 * screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 28 * screenWidth),
        decoration: BoxDecoration(
          color: isDashboardTabSelected ? primary : sectionColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: isDashboardTabSelected ? white : black,
              fontWeight:
                  isDashboardTabSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
