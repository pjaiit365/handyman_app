import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Read%20Data/get_user_first_name.dart';
import 'package:handyman_app/Screens/My%20Jobs/my_jobs_screen.dart';
import 'package:handyman_app/Screens/Profile/Profile%20-%20Handyman/profile_handyman.dart';
import 'package:handyman_app/Screens/Settings/settings_screen.dart';

import '../../../../Components/drawer_header.dart';
import '../../../../Components/drawer_tile.dart';
import '../../../../constants.dart';
import '../../../Favourites/Handyman/handyman_favourites_screen.dart';
import '../../../Home/home_screen.dart';
import '../../../Login/login_screen.dart';
import '../../../Notifications/notification_screen.dart';

class HandymanDrawer extends StatelessWidget {
  const HandymanDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future signOut() async {
      await FirebaseAuth.instance.signOut();
      allUsers.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false);
    }

    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        elevation: 0,
        width: 287 * screenWidth,
        backgroundColor: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8 * screenHeight),
            DrawerHeaderCreated(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 20.0, vertical: 21 * screenHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_right, color: black, size: 35),
                  SizedBox(width: 17 * screenWidth),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 190 * screenWidth,
                          child: Text(
                            allUsers[0].firstName + ' ' + allUsers[0].lastName,
                            style: TextStyle(
                              color: black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 9 * screenHeight),
                        SizedBox(
                          width: 190 * screenWidth,
                          child: Text(
                            allUsers[0].email,
                            style: TextStyle(
                              color: black,
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 23.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 1 * screenHeight,
                      width: screenWidth * 233,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  DrawerTile(
                    title: 'Home',
                    icon: Icons.home_rounded,
                    screen: HomeScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  DrawerTile(
                    title: 'Profile',
                    icon: Icons.person,
                    screen: HandymanProfileScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  DrawerTile(
                    title: 'My Jobs',
                    icon: Icons.work_history_rounded,
                    screen: MyJobsScreen(),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  Center(
                    child: Container(
                      height: 1 * screenHeight,
                      width: screenWidth * 233,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  DrawerTile(
                    title: 'Notification',
                    icon: Icons.notifications,
                    screen: NotificationScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  DrawerTile(
                    title: 'Favourites',
                    icon: Icons.favorite,
                    screen: HandymanFavouritesScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  DrawerTile(
                    title: 'Payment & Cards',
                    icon: Icons.wallet_rounded,
                    screen: NotificationScreen(),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  Center(
                    child: Container(
                      height: 1 * screenHeight,
                      width: screenWidth * 233,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  DrawerTile(
                    title: 'Contact Us',
                    icon: Icons.call,
                    screen: NotificationScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  DrawerTile(
                    title: 'Help/Support',
                    icon: Icons.help_rounded,
                    screen: NotificationScreen(),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  Center(
                    child: Container(
                      height: 1 * screenHeight,
                      width: screenWidth * 233,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 27 * screenHeight),
                  DrawerTile(
                    title: 'Settings',
                    icon: Icons.settings,
                    screen: SettingsScreen(),
                  ),
                  SizedBox(height: 20 * screenHeight),
                  GestureDetector(
                    onTap: signOut,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.logout, color: primary),
                        SizedBox(width: 22 * screenWidth),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20 * screenHeight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
