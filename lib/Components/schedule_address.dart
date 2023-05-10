import 'package:flutter/material.dart';

import '../constants.dart';
import 'address_bars.dart';
import 'appointment_tab_row.dart';

class ScheduleAddress extends StatelessWidget {
  const ScheduleAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * screenWidth,
          vertical: 19 * screenHeight,
        ),
        // height: 183 * screenHeight,
        width: 383 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppointmentTabRow(tabTitle: 'Address', isCustomVisible: false),
            SizedBox(height: 16 * screenHeight),
            AddressBars(
              heading: 'Type',
              text: 'Home',
            ),
            SizedBox(height: 10 * screenHeight),
            AddressBars(
                heading: 'Full Address',
                text: 'Add here...',
                isFullAddressBar: true),
            SizedBox(height: 14 * screenHeight),
          ],
        ),
      ),
    );
  }
}
