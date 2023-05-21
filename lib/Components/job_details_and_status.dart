import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/Screens/My%20Jobs/my_jobs_screen.dart';

import '../constants.dart';
import 'appointment_job_details.dart';
import 'appointment_job_status.dart';

class JobDetailsAndStatus extends StatelessWidget {
  bool isJobPendingActive;
  bool isJobInProgressActive;
  bool isJobCompletedAcitve;
  final Widget screen;
  String statusText;
  bool isJobOfferScreen;
  bool isJobInProgessScreen;
  String buttonText;
  JobDetailsAndStatus({
    Key? key,
    this.buttonText = 'Accept',
    this.statusText = 'Job Pending',
    this.isJobOfferScreen = false,
    this.isJobInProgessScreen = false,
    this.isJobPendingActive = false,
    this.isJobCompletedAcitve = false,
    this.isJobInProgressActive = false,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.5 * screenWidth,
        vertical: 10 * screenHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10 * screenHeight),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 92 * screenHeight,
                  width: 87.65 * screenWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_pic.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 19.35 * screenWidth),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2 * screenWidth, top: 12 * screenHeight),
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight: 40 * screenHeight,
                            maxHeight: 170 * screenHeight),
                        child: Text(
                          'Harry Garret',
                          style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ),
                    // SizedBox(height: 17 * screenHeight),
                    Text(
                      '\$' + '15/hr',
                      style: TextStyle(
                        color: black,
                        fontSize: 27.64,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ],
                ),
                SizedBox(width: 10 * screenWidth),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 10.5),
                  child: Icon(Icons.verified_rounded, color: green),
                ),
              ],
            ),
          ),
          SizedBox(height: 19 * screenHeight),
          AppointmentJobDetails(),
          isJobOfferScreen ? SizedBox(height: 28 * screenHeight) : SizedBox(),
          isJobInProgessScreen
              ? SizedBox(height: 28 * screenHeight)
              : SizedBox(),
          isJobInProgessScreen
              ? Center(
                  child: Container(
                    height: 44 * screenHeight,
                    width: 365 * screenWidth,
                    decoration: BoxDecoration(
                      color: Color(0xff96C2CC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/icons/location.png'),
                        SizedBox(width: 9 * screenWidth),
                        Text(
                          buttonText,
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          isJobOfferScreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyJobsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 44 * screenHeight,
                        width: 181 * screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xffFF1600),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/icons/cancel.png'),
                            SizedBox(width: 9 * screenWidth),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 3 * screenWidth),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screen,
                          ),
                        );
                      },
                      child: Container(
                        height: 44 * screenHeight,
                        width: 181 * screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xff2A960B),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/icons/correct.png'),
                            SizedBox(width: 9 * screenWidth),
                            Text(
                              buttonText,
                              style: TextStyle(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(height: 28 * screenHeight),
          AppointmentJobStatus(
            jobAccepted: statusText,
            isJobCompletedAcitve: isJobCompletedAcitve,
            isJobInProgressActive: isJobInProgressActive,
            isJobPendingActive: isJobPendingActive,
          ),
          SizedBox(height: 23 * screenHeight),
        ],
      ),
    );
  }
}
