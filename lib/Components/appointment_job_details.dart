import 'package:flutter/material.dart';

import '../constants.dart';

class AppointmentJobDetails extends StatelessWidget {
  const AppointmentJobDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 274 * screenHeight,
        ),
        width: 383 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.only(
          left: 30 * screenWidth,
          right: 26 * screenWidth,
          top: 23 * screenHeight,
          bottom: 20 * screenHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Job Details',
                  style: TextStyle(
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 31 * screenHeight,
                  width: 30 * screenWidth,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: primary, width: 2),
                  ),
                  child: Center(
                    child: Image.asset('assets/icons/i_logo.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12 * screenHeight),
            Text(
              'Job',
              style: TextStyle(
                color: primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4 * screenHeight),
            Text(
              'Plumbing',
              style: TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12 * screenHeight),
            Text(
              'Date',
              style: TextStyle(
                color: primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4 * screenHeight),
            Text(
              '22-05-2023',
              style: TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12 * screenHeight),
            Text(
              'Address',
              style: TextStyle(
                color: primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4 * screenHeight),
            Text(
              'M9A'.toUpperCase() +
                  ', ' +
                  'LOWER SADELMI'.toUpperCase() +
                  ',\n'
                          'Akosombo'
                      .toUpperCase() +
                  ',\n' +
                  'E/R'.toUpperCase() +
                  ', ' +
                  'Ghana'.toUpperCase(),
              style: TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
