import 'package:flutter/material.dart';

import '../constants.dart';

class SummaryElement extends StatelessWidget {
  final String title;
  final String subtitle;
  const SummaryElement({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 4 * screenHeight),
        Text(
          subtitle,
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
