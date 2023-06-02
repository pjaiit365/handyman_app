import 'package:flutter/material.dart';
import 'package:handyman_app/constants.dart';
import '../../../../Components/profile_location_information.dart';
import '../../../../Components/profile_payment_information.dart';
import '../../../../Components/profile_personal_information.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15 * screenWidth, vertical: 10 * screenHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 185.75 * screenHeight,
                    width: 177 * screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile_pic.jpeg'),
                          fit: BoxFit.fill,
                        )),
                    alignment: Alignment.bottomRight,
                  ),
                  Positioned(
                    bottom: -13,
                    right: -17,
                    child: Container(
                      height: 35 * screenHeight,
                      width: 35 * screenWidth,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sectionColor,
                        border: Border.all(color: white, width: 3),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25 * screenHeight),
            ProfilePersonalInformation(),
            SizedBox(height: 25 * screenHeight),
            // ProfilePaymentInformation(),
            SizedBox(height: 25 * screenHeight),
            ProfileLocationInformation(),
            SizedBox(height: 15 * screenHeight),
          ],
        ),
      ),
    );
  }
}
