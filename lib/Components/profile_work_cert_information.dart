import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';

import '../constants.dart';

class ProfileWorkExpInformation extends StatelessWidget {
  const ProfileWorkExpInformation({
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
            'Work Experience & Certifications',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 9 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 320),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItemAddFile(
                selectedOptions: selectedServiceCatList,
                title: 'Certification',
                hintText: 'Add certification here...',
                listName: serviceCategoryList,
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItemAddFile(
                selectedOptions: selectedServiceProvList,
                title: 'Experience',
                hintText: 'Add any previous work here...',
                listName: servicesProvidedList,
              ),
              SizedBox(height: 20 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(
                    isOverallRating: true,
                    title: 'Charge',
                    hintText: '',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 140,
                  ),
                  SizedBox(width: 20 * screenWidth),
                  ProfileItem(
                    title: 'Number of Jobs',
                    hintText: '...',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 139,
                  ),
                ],
              ),
              SizedBox(height: 10 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
