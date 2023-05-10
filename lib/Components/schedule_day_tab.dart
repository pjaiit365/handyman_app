import 'package:flutter/material.dart';

import '../constants.dart';
import 'appointment_date.dart';
import 'appointment_tab_row.dart';

class ScheduleDayTab extends StatelessWidget {
  const ScheduleDayTab({
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
        height: 159 * screenHeight,
        width: 383 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppointmentTabRow(tabTitle: 'Schedule Day'),
            SizedBox(height: 16 * screenHeight),
            Flexible(
              child: Center(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AppointmentDate(
                          date: dateList[index],
                          day: daysList[index],
                          index: index,
                        ),
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 12 * screenWidth);
                    },
                    itemCount: 7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
