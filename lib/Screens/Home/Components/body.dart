import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Read%20Data/get_user_first_name.dart';
import 'package:handyman_app/Screens/Dashboard/Handymen/handymen_dashboard_screen.dart';
import 'package:handyman_app/Screens/Dashboard/Jobs/jobs_dashboard_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/my_jobs_screen.dart';
import 'package:handyman_app/Screens/Notifications/notification_screen.dart';
import 'package:handyman_app/Screens/Profile/Profile%20-%20Customer/profile_customer.dart';
import 'package:handyman_app/Screens/Profile/Profile%20-%20Handyman/profile_handyman.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/home_buttons.dart';
import '../../../Components/home_screen_tabs.dart';
import '../../../Components/horizontal_divider.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetUserFirstName(),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 26),
              child: Text(
                'What services do you need?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 40.0),
              child: Center(
                child: HomeScreenTabs(
                  title: 'HANDYMEN',
                  screen: HandymanDashboardScreen(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 30.0),
              child: HorizontalDivider(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 50.0),

              //Dummy Button
              // child: Center(
              //   child: HomeScreenTabs(
              //     title: 'JOBS',
              //     screen: JobsDashboardScreen(),
              //   ),
              // ),
              child: allUsers[0].role == 'Regular Customer'
                  ? Center(
                      child: HomeScreenTabs(
                        isButtonClickable: false,
                        title: 'JOBS',
                        screen: JobsDashboardScreen(),
                      ),
                    )
                  : Center(
                      child: HomeScreenTabs(
                        title: 'JOBS',
                        screen: JobsDashboardScreen(),
                      ),
                    ),
            ),
            allUsers[0].role == 'Regular Customer'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeButtons(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationScreen(),
                              ),
                            );
                          },
                          title: 'Bookings'),
                      Container(
                        height: size.height * 40 / 820.5714,
                        width: size.width * 2 / 411.4285,
                        color: grey,
                      ),
                      HomeButtons(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileCustomer(),
                              ),
                            );
                          },
                          title: 'Profile'),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeButtons(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyJobsScreen(),
                              ),
                            );
                          },
                          title: 'My Jobs'),
                      Container(
                        height: size.height * 40 / 820.5714,
                        width: size.width * 2 / 411.4285,
                        color: grey,
                      ),
                      HomeButtons(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HandymanProfileScreen(),
                              ),
                            );
                          },
                          title: 'Profile'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
