import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';
import '../constants.dart';

class ProfilePersonalInformation extends StatelessWidget {
  const ProfilePersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 5.0),
          child: Text(
            'Personal Information',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 9 * screenHeight),
        Container(
          height: 325 * screenHeight,
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItem(
                title: 'Name',
                hintText: 'Enter name here...',
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(title: 'Email', hintText: 'Enter email here...'),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(
                  title: 'Mobile Number',
                  hintText: 'Enter contact number here...')
            ],
          ),
        ),
      ],
    );
  }
}
