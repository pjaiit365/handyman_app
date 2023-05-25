import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Forgot%20Password/forgot_password_screen.dart';
import 'package:handyman_app/Screens/Home/home_screen.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/credentials_button.dart';
import '../../../Components/credentials_container.dart';
import '../../../Components/social_media_container.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 19.5,
          vertical: 35 * screenHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 35 * screenHeight),
            Padding(
              padding: EdgeInsets.only(left: 5.5 * screenWidth),
              child: Text(
                'Welcome Back! 👋',
                style: TextStyle(
                  color: black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 6.5 * screenWidth,
                  top: 15 * screenHeight,
                  bottom: 54 * screenHeight),
              child: Text(
                "Hello again, you've been missed!",
                style: TextStyle(
                  color: semiGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CredentialsContainer(
              title: 'Email Address',
              hintText: 'Enter email address',
              isPassword: false,
            ),
            SizedBox(height: 20 * screenHeight),
            CredentialsContainer(
              title: 'Password',
              hintText: 'Enter password',
              isPassword: true,
            ),
            SizedBox(height: 20 * screenHeight),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRememberMeClicked = !isRememberMeClicked;
                      });
                    },
                    child: Container(
                      height: 20 * screenHeight,
                      width: 20 * screenWidth,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(2),
                        border:
                            Border.all(color: appointmentTimeColor, width: 1),
                      ),
                      alignment: Alignment.center,
                      child: isRememberMeClicked
                          ? Container(
                              height: 16 * screenHeight,
                              width: 16 * screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                // borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )),
                            )
                          : SizedBox(),
                    ),
                  ),
                  SizedBox(width: 12 * screenWidth),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 2.0),
                    child: Text(
                      'Remember Me',
                      style: TextStyle(
                        height: 1.2,
                        color: black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  SizedBox(width: 99 * screenWidth),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color(0xffbd3a32),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40 * screenHeight),
            CredentialsButton(
              screen: HomeScreen(),
            ),
            SizedBox(height: 30 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 1.5 * screenHeight,
                  width: 108 * screenWidth,
                  color: grey,
                ),
                SizedBox(width: 24 * screenWidth),
                Text(
                  'Or Login With',
                  style: TextStyle(
                    color: black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 24 * screenWidth),
                Container(
                  height: 1.5 * screenHeight,
                  width: 108 * screenWidth,
                  color: grey,
                ),
              ],
            ),
            SizedBox(height: 30 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SocialMediaContainer(
                  text: 'Facebook',
                  iconLocation: 'assets/icons/facebook.png',
                ),
                SizedBox(width: 10 * screenWidth),
                SocialMediaContainer(
                  text: 'Google',
                  iconLocation: 'assets/icons/google.png',
                ),
              ],
            ),
            SizedBox(height: 89 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: semiGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5 * screenWidth),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
