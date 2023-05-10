import 'package:flutter/material.dart';
import 'package:handyman_app/Components/personnel_rating_summary.dart';

import '../constants.dart';

class PersonnelInfoSummary extends StatelessWidget {
  const PersonnelInfoSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PersonnelRatingSummary(),
        Container(
          height: 7 * screenHeight,
          width: 7 * screenWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: black,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '149.5 km',
              style: TextStyle(
                  color: black, fontSize: 19, fontWeight: FontWeight.w700),
            ),
            Text(
              'away from you',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w300, color: black),
            ),
          ],
        ),
        Container(
          height: 7 * screenHeight,
          width: 7 * screenWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: black,
          ),
        ),
        Text(
          '\$' + '15/hr',
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w700,
            fontSize: 27.64,
          ),
        )
      ],
    );
  }
}
