import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyJobsTabs extends StatefulWidget {
  const MyJobsTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<MyJobsTabs> createState() => _MyJobsTabsState();
}

class _MyJobsTabsState extends State<MyJobsTabs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 54 * screenHeight,
        width: 385 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appointmentTimeColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isJobUpcomingClicked = !isJobUpcomingClicked;
                });
                if (isJobUpcomingClicked == true) {
                  isJobCompletedClicked = false;
                  isJobOffersClicked = false;
                }
                if (isJobCompletedClicked == false &&
                    isJobOffersClicked == false) isJobUpcomingClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Upcoming',
                  style: isJobUpcomingClicked
                      ? TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      : TextStyle(
                          color: black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ),
            ),
            Container(
              height: 54 * screenHeight,
              width: 5 * screenWidth,
              color: white,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isJobOffersClicked = !isJobOffersClicked;
                });
                if (isJobOffersClicked == true) {
                  isJobCompletedClicked = false;
                  isJobUpcomingClicked = false;
                }
                if (isJobCompletedClicked == false &&
                    isJobUpcomingClicked == false) isJobOffersClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Offers',
                  style: isJobOffersClicked
                      ? TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      : TextStyle(
                          color: black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ),
            ),
            Container(
              height: 54 * screenHeight,
              width: 5 * screenWidth,
              color: white,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isJobCompletedClicked = !isJobCompletedClicked;
                });
                if (isJobCompletedClicked == true) {
                  isJobUpcomingClicked = false;
                  isJobOffersClicked = false;
                }
                if (isJobUpcomingClicked == false &&
                    isJobOffersClicked == false) isJobCompletedClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Completed',
                  style: isJobCompletedClicked
                      ? TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      : TextStyle(
                          color: black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
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
