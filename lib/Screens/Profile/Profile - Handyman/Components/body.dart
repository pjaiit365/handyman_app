import 'package:flutter/material.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/profile_item.dart';
import '../../../../Components/profile_personal_information.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
              child: Container(
                height: 195 * screenHeight,
                width: 182 * screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: Container(
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
              ),
            ),
            SizedBox(height: 20 * screenHeight),
            ProfilePersonalInformation(),
            SizedBox(height: 25 * screenHeight),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 5.0),
                  child: Text(
                    'Service Information',
                    style: TextStyle(
                      color: black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 9 * screenHeight),
                Container(
                  height: 422 * screenHeight,
                  width: 359 * screenWidth,
                  decoration: BoxDecoration(
                      color: sectionColor,
                      borderRadius: BorderRadius.circular(13)),
                  padding: EdgeInsets.symmetric(
                      horizontal: 23 * screenWidth,
                      vertical: 22 * screenHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileItem(
                        title: 'Name',
                        hintText: 'Enter name here...',
                      ),
                      SizedBox(height: 20 * screenHeight),
                      ProfileItem(
                          title: 'Email', hintText: 'Enter email here...'),
                      SizedBox(height: 20 * screenHeight),
                      ProfileItem(
                          title: 'Mobile Number',
                          hintText: 'Enter contact number here...')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
