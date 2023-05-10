import 'package:flutter/material.dart';

import '../constants.dart';
import 'appointment_static_time.dart';
import 'appointment_tab_row.dart';

class ScheduleTimeTab extends StatelessWidget {
  const ScheduleTimeTab({
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
        height: 172 * screenHeight,
        width: 383 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppointmentTabRow(tabTitle: 'Schedule Time'),
            SizedBox(height: 16 * screenHeight),
            Flexible(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 11 * screenWidth),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                // clipBehavior: Clip.hardEdge,
                itemCount: timeList.length,

                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,

                itemBuilder: (context, index) {
                  return AppointmentStaticTime(time: timeList[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 17 * screenWidth,
                    crossAxisSpacing: 12 * screenHeight,
                    mainAxisExtent: 96 * screenWidth,
                    crossAxisCount: 2),
              ),
            ),
            SizedBox(height: 10 * screenHeight),
          ],
        ),
      ),
    );
  }
}
