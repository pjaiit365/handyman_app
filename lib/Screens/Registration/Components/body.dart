import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Login/login_screen.dart';
import 'package:handyman_app/Screens/Registration/Sub%20Screen/Registration%20Continuation/registration_continuation_screen.dart';

import '../../../Components/credentials_button.dart';
import '../../../Components/credentials_container.dart';
import '../../../Components/social_media_container.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                  'Create Account',
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
                  "Register today to start a future with us...",
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
              CredentialsContainer(
                title: 'Confirm Password',
                hintText: 'Enter password',
                isPassword: true,
              ),
              SizedBox(height: 20 * screenHeight),
              CredentialsContainer(
                title: 'Mobile Number',
                iconText: '#',
                hintText: 'Enter mobile number',
                isPassword: false,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 2.5),
                    child: Text(
                      'Role',
                      style: TextStyle(
                        color: black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 12 * screenHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 53 * screenHeight,
                        width: 51 * screenWidth,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(7),
                          border:
                              Border.all(color: appointmentTimeColor, width: 1),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/role_icon.png',
                            height: 15.23 * screenHeight,
                            width: 21.75 * screenWidth,
                            color: semiGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: 12 * screenWidth),
                      DropdownButton2(
                        buttonStyleData: ButtonStyleData(
                          elevation: 0,
                          height: 53 * screenHeight,
                          width: 288 * screenWidth,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: appointmentTimeColor, width: 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15 * screenWidth,
                              vertical: 15 * screenHeight),
                        ),
                        underline: Text(''),
                        dropdownStyleData: DropdownStyleData(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10 * screenWidth,
                              vertical: 10 * screenHeight),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Image.asset('assets/icons/down_arrow.png',
                              color: semiGrey),
                          iconDisabledColor: black,
                          iconEnabledColor: primary,
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Specify role in app',
                          style: TextStyle(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.w200),
                        ),
                        items: userRoleList.map((String serviceCategoryList) {
                          return DropdownMenuItem(
                            child: Text(serviceCategoryList),
                            value: serviceCategoryList,
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            roleValue = newValue!;
                            roleSelected = roleValue;
                          });
                        },
                        value: roleValue,
                      ),
                    ],
                  )
                ],
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
                          isTermsAndCondAgreed = !isTermsAndCondAgreed;
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
                        child: isTermsAndCondAgreed
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
                        'I agree to the terms and conditions',
                        style: TextStyle(
                          height: 1.2,
                          color: black,
                          fontSize: 15,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40 * screenHeight),
              isTermsAndCondAgreed
                  ? CredentialsButton(
                      buttonText: 'Sign Up',
                      screen: roleSelected == 'Regular Customer'
                          ? LoginScreen()
                          : RegistrationContinuationScreen(),
                    )
                  : Container(
                      height: 53 * screenHeight,
                      width: 351 * screenWidth,
                      decoration: BoxDecoration(
                        color: sectionColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
                  SizedBox(width: 19.5 * screenWidth),
                  Text(
                    'Or Sign Up With',
                    style: TextStyle(
                      color: black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 19.5 * screenWidth),
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
                    "Already have an account?",
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
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
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
