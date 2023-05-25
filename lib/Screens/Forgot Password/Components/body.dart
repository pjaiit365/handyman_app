import 'package:flutter/material.dart';
import 'package:handyman_app/Components/credentials_button.dart';
import 'package:handyman_app/Components/credentials_container.dart';
import 'package:handyman_app/Screens/Forgot%20Password/Sub%20Screens/Check%20Mail/check_mail_screen.dart';
import 'package:handyman_app/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 19.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15 * screenHeight),
          Center(
            child: Image.asset(
              'assets/images/forgot_password.png',
              height: 161.44 * screenHeight,
              width: 242.77 * screenWidth,
            ),
          ),
          SizedBox(height: 37.56 * screenHeight),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 5.5),
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 15 * screenHeight),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 7.5),
            child: Container(
              width: 335 * screenWidth,
              child: Text(
                'Don’t worry it happen. Reset your password by '
                'entering your email below and follow the '
                'instructions sent by mail to your account.',
                style: TextStyle(
                  height: 1.45,
                  color: semiGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 49 * screenHeight),
          CredentialsContainer(
            title: 'Email address',
            hintText: 'Enter your email address',
          ),
          SizedBox(height: 92 * screenHeight),
          Center(
            child: CredentialsButton(
              screen: CheckMailScreen(),
              buttonText: 'Send Instructions',
            ),
          ),
        ],
      ),
    );
  }
}

// Don’t worry it happen. Reset your password by
// entering your email below and follow the
// instructions sent by mail to your account.
