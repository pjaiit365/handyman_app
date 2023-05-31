import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Forgot%20Password/forgot_password_screen.dart';
import 'package:handyman_app/Screens/Home/home_screen.dart';
import 'package:handyman_app/Screens/Registration/registration_screen.dart';
import 'package:handyman_app/constants.dart';
import '../../../Components/credentials_button.dart';
import '../../../Components/credentials_container.dart';
import '../../../Components/social_media_container.dart';
import '../../../Models/users.dart';
import '../../../Read Data/get_user_first_name.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      //user sign in with credentials
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //obtaining current user's UID from firebase
      userId = FirebaseAuth.instance.currentUser!.uid;
      //getting current user's data into in-app variable for easy access
      getUserData();

      //display alert dialog box with loading indicator
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (Platform.isIOS)
                    ? const CupertinoActivityIndicator(
                        radius: 20,
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          );
        },
      );

      //Delaying opening next route(screen) in order to load data needed on next screen
      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      });

      loginTextFieldError = false;
    } on FirebaseAuthException catch (e) {
      setState(() {
        loginTextFieldError = true;
      });
      print(e.message.toString());
    }
  }

  late final String userId;

  Future getUserData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      final userLogin = UserData(
        user_id: userData['User ID'],
        first_name: userData['First Name'],
        last_name: userData['Last Name'],
        number: userData['Mobile Number'],
        email: userData['Email Address'],
        role: userData['Role'],
      );
      allUsers.add(userLogin);
      return userData;
    } else {
      return 'User Not Found.';
    }
  }

  @override
  void initState() {
    allUsers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                errorTextField: loginTextFieldError,
                controller: _emailController,
                title: 'Email Address',
                hintText: 'Enter email address',
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20 * screenHeight),
              CredentialsContainer(
                errorTextField: loginTextFieldError,
                controller: _passwordController,
                title: 'Password',
                hintText: 'Enter password',
                isPassword: true,
              ),
              loginTextFieldError
                  ? SizedBox(height: 20 * screenHeight)
                  : SizedBox(),
              loginTextFieldError
                  ? Center(
                      child: Text(
                        'Incorrect email or password. Try again.',
                        style: TextStyle(
                          color: complementaryRed,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : SizedBox(),
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
                    Spacer(),
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
                          color: complementaryRed,
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
                screen: signIn,
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
              loginTextFieldError
                  ? SizedBox(height: 65 * screenHeight)
                  : SizedBox(height: 89 * screenHeight),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
