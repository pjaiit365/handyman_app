// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../Components/appointment_tab_row.dart';
import '../../../constants.dart';

class ApplicationPortfolioTab extends StatelessWidget {
  const ApplicationPortfolioTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future selectPortfolio() async {
      try {
        final files = FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.media,
        );

        if (files != null) {}
      } catch (e) {
        print(e.toString());
      }
    }

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * screenWidth,
          vertical: 19 * screenHeight,
        ),
        constraints: BoxConstraints(minHeight: 135 * screenHeight),
        width: 383 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppointmentTabRow(tabTitle: 'Portfolio', isCustomVisible: false),
            SizedBox(height: 22 * screenHeight),
            GestureDetector(
              onTap: selectPortfolio,
              child: Center(
                child: Container(
                  height: 34 * screenHeight,
                  width: 322 * screenWidth,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(width: 1, color: appointmentTimeColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15 * screenWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Media:',
                        style: TextStyle(
                          color: chatTimeColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Add portfolio here...',
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.add,
                        color: black,
                      ),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
            ),
            jobApplicationMediaCount == 0
                ? SizedBox()
                : SizedBox(height: 15 * screenHeight),
            jobApplicationMediaCount == 0
                ? SizedBox()
                : Text(
                    'Media Count: $jobApplicationMediaCount',
                    style: TextStyle(
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            jobApplicationMediaCount == 0
                ? SizedBox()
                : SizedBox(height: 15 * screenHeight),
            jobApplicationMediaCount == 0
                ? SizedBox()
                : SizedBox(
                    height: 90 * screenHeight,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 90 * screenHeight,
                            width: 80 * screenWidth,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(9),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 19 * screenWidth);
                        },
                        itemCount: 5),
                  ),
          ],
        ),
      ),
    );
  }
}
