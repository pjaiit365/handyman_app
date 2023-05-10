import 'package:flutter/material.dart';
import 'package:handyman_app/Components/summary_element.dart';

import '../constants.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(
        left: 24 * screenWidth,
        right: 23 * screenWidth,
        top: 21 * screenHeight,
        bottom: 25 * screenHeight,
      ),
      // height: 357 * screenHeight,
      width: 316 * screenWidth,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SummaryElement(title: 'Name', subtitle: 'Harry Garret'),
            SizedBox(height: 15 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SummaryElement(title: 'Charge', subtitle: '\$ ' + '15'),
                SummaryElement(title: 'Charge per', subtitle: 'Hour'),
              ],
            ),
            SizedBox(height: 15 * screenHeight),
            SummaryElement(title: 'Job', subtitle: 'Plumbing'),
            SizedBox(height: 15 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SummaryElement(title: 'Date', subtitle: '01-05-2023'),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 8.0),
                  child: SummaryElement(title: 'Time', subtitle: '10:30 AM'),
                ),
              ],
            ),
            SizedBox(height: 15 * screenHeight),
            Text(
              'Address',
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 4 * screenHeight),
            Text(
              'M9A, LOWER SADELMI,\n'
                      'AKOSOMBO,\n'
                      'E/R,GHANA'
                  .toUpperCase(),
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 15 * screenHeight),
            SummaryElement(
              title: 'Note',
              subtitle: 'Make sure to lock the door and give the '
                  'keys to the neighbours on your way our. \n\nThank you. ',
            )
          ],
        ),
      ),
    );
  }
}
