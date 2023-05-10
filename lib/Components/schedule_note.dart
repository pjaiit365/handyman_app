import 'package:flutter/material.dart';

import '../constants.dart';
import 'appointment_tab_row.dart';
import 'note_text_area.dart';

class ScheduleNote extends StatelessWidget {
  const ScheduleNote({
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
            AppointmentTabRow(tabTitle: 'Notes', isCustomVisible: false),
            SizedBox(height: 16 * screenHeight),
            NoteTextArea(),
            SizedBox(height: 21 * screenHeight),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 11.0),
              child: Container(
                height: 47 * screenHeight,
                width: 324 * screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: primary,
                ),
                child: Center(
                  child: Text(
                    'Add Note',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
