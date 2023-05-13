import 'package:flutter/material.dart';

import '../../../constants.dart';

class JobDetailsTab extends StatefulWidget {
  const JobDetailsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<JobDetailsTab> createState() => _JobDetailsTabState();
}

class _JobDetailsTabState extends State<JobDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 54 * screenHeight,
        width: 367 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appointmentTimeColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 52 * screenWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  isJobAboutClicked = !isJobAboutClicked;
                });
                if (isJobAboutClicked == true) isJobPortfolioClicked = false;
                if (isJobPortfolioClicked == false) isJobAboutClicked = true;
              },
              child: Container(
                width: 76 * screenWidth,
                alignment: Alignment.center,
                child: Text(
                  'About',
                  style: isJobAboutClicked
                      ? TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: grey,
                          fontSize: 17,
                        ),
                ),
              ),
            ),
            SizedBox(width: 52 * screenWidth),
            Container(
              height: 54 * screenHeight,
              width: 5 * screenWidth,
              color: white,
            ),
            SizedBox(width: 52 * screenWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  isJobPortfolioClicked = !isJobPortfolioClicked;
                });
                if (isJobPortfolioClicked == true) isJobAboutClicked = false;
                if (isJobAboutClicked == false) isJobPortfolioClicked = true;
              },
              child: Container(
                width: 76 * screenWidth,
                alignment: Alignment.center,
                child: Text(
                  'Portflio',
                  style: isJobPortfolioClicked
                      ? TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: grey,
                          fontSize: 17,
                        ),
                ),
              ),
            ),
            SizedBox(width: 52 * screenWidth),
          ],
        ),
      ),
    );
  }
}
