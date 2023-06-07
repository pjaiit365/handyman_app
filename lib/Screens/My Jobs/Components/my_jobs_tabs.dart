import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyJobsTabs extends StatefulWidget {
  bool isJobUpcomingClicked;
  bool isJobOffersClicked;
  bool isJobCompletedClicked;
  MyJobsTabs({
    Key? key,
    this.isJobUpcomingClicked = true,
    this.isJobOffersClicked = true,
    this.isJobCompletedClicked = false,
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
                  widget.isJobUpcomingClicked = !widget.isJobUpcomingClicked;
                });
                if (widget.isJobUpcomingClicked == true) {
                  widget.isJobCompletedClicked = false;
                  widget.isJobOffersClicked = false;
                }
                if (widget.isJobCompletedClicked == false &&
                    widget.isJobOffersClicked == false)
                  widget.isJobUpcomingClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Upcoming',
                  style: widget.isJobUpcomingClicked
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
                  widget.isJobOffersClicked = !widget.isJobOffersClicked;
                });
                if (widget.isJobOffersClicked == true) {
                  widget.isJobCompletedClicked = false;
                  widget.isJobUpcomingClicked = false;
                }
                if (widget.isJobCompletedClicked == false &&
                    widget.isJobUpcomingClicked == false)
                  widget.isJobOffersClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Offers',
                  style: widget.isJobOffersClicked
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
                  widget.isJobCompletedClicked = !widget.isJobCompletedClicked;
                });
                if (widget.isJobCompletedClicked == true) {
                  widget.isJobUpcomingClicked = false;
                  widget.isJobOffersClicked = false;
                }
                if (widget.isJobUpcomingClicked == false &&
                    widget.isJobOffersClicked == false)
                  widget.isJobCompletedClicked = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 108 * screenWidth,
                child: Text(
                  'Completed',
                  style: widget.isJobCompletedClicked
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
