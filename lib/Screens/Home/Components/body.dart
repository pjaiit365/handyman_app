import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Dashboard/Handymen/handymen_dashboard_screen.dart';
import 'package:handyman_app/Screens/Dashboard/Jobs/jobs_dashboard_screen.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/home_buttons.dart';
import '../../../Components/home_screen_tabs.dart';
import '../../../Components/horizontal_divider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi ' + 'Jed' + ',',
            style: TextStyle(
                fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
          ),
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
            child: Center(
              child: HomeScreenTabs(
                title: 'JOBS',
                screen: JobsDashboardScreen(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeButtons(press: () {}, title: 'My Jobs'),
              Container(
                height: size.height * 40 / 820.5714,
                width: size.width * 2 / 411.4285,
                color: grey,
              ),
              HomeButtons(press: () {}, title: 'Profile'),
            ],
          ),
        ],
      ),
    );
  }
}
