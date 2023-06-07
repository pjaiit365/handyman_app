import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Login/login_screen.dart';
import 'package:handyman_app/Screens/Registration/registration_screen.dart';

import '../../../Components/appointment_button.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 37.0,
                right: 23 * screenWidth,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome to',
                        style: TextStyle(
                          color: black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 6 * screenWidth),
                      Text(
                        'HomeCareX',
                        style: TextStyle(
                          color: primary,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 13.0,
                      top: 13 * screenHeight,
                    ),
                    child: Text(
                      '"Your trusted Handyman Service"',
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontFamily: 'Junge',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50 * screenHeight),
            Image.asset(
              'assets/images/welcome_pic.png',
              height: 223.41 * screenHeight,
              width: 381 * screenWidth,
            ),
            SizedBox(height: 48 * screenHeight),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 324 * screenWidth,
                    child: Text(
                      'Discover a seamless and efficient way to '
                      'find  and book reliable professional '
                      'handyman services.',
                      style: TextStyle(
                        color: black,
                        fontSize: 17,
                        fontFamily: 'Junge',
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 2 * screenHeight),
                  Text(
                    "Wait! There's more...",
                    style: TextStyle(
                      color: primary,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 324 * screenWidth,
                    child: Text(
                      'As a professional handyman, here is a '
                      'platform to showcase your skills and'
                      'experience to find gigs.',
                      style: TextStyle(
                        height: 1.3,
                        color: black,
                        fontSize: 17,
                        fontFamily: 'Junge',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 85 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppointmentButton(
                  isWelcomeScreen: true,
                  text: 'Log In',
                  containerColor: primary,
                  textColor: white,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 3 * screenWidth),
                AppointmentButton(
                  isWelcomeScreen: true,
                  text: 'Register',
                  containerColor: sectionColor,
                  textColor: textGreyColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
