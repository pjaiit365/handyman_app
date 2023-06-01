import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Login/login_screen.dart';
import 'package:handyman_app/Screens/Settings/Components/settings_divider.dart';
import 'package:handyman_app/Screens/Settings/Components/settings_tab.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 20.0, vertical: 5 * screenHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'General',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(
                bottom: screenHeight * 24.44, top: 20 * screenHeight),
            child: Container(
              height: 1 * screenHeight,
              width: 350 * screenWidth,
              color: grey,
            ),
          )),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SettingsTab(
                  title: generalSectionList[index],
                  iconLocation: generalSectionIcons[index],
                );
              },
              separatorBuilder: (context, index) {
                return SettingsDivider();
              },
              itemCount: generalSectionList.length),
          SizedBox(height: 34.5 * screenHeight),
          Text(
            'Support',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(
                bottom: screenHeight * 24.44, top: 20 * screenHeight),
            child: Container(
              height: 1 * screenHeight,
              width: 350 * screenWidth,
              color: grey,
            ),
          )),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SettingsTab(
                  title: supportSectionList[index],
                  iconLocation: supportSectionIcons[index],
                );
              },
              separatorBuilder: (context, index) {
                return SettingsDivider();
              },
              itemCount: supportSectionList.length),
          SizedBox(height: 35.4 * screenHeight),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/icons/sign_out.png'),
                SizedBox(width: 12.39 * screenWidth),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: complementaryRed,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
