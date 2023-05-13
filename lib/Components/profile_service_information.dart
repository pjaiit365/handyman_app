import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';

import '../constants.dart';

class ProfileServiceInformation extends StatelessWidget {
  const ProfileServiceInformation({
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
          constraints: BoxConstraints(
            minHeight: 422 * screenHeight,
          ),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItemDropDown(
                selectedOptions: selectedServiceCatList,
                title: 'Service Category',
                hintText: 'Choose all that apply...',
                listName: serviceCategoryList,
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItemDropDown(
                selectedOptions: selectedServiceProvList,
                title: 'Services Provided',
                hintText: 'Choose all that apply...',
                listName: servicesProvidedList,
              ),
              SizedBox(height: 20 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(
                    title: 'Charge',
                    hintText: '...',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 73,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 29.0, left: 10 * screenWidth),
                    child: Container(
                      height: 47 * screenHeight,
                      width: 40 * screenWidth,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(7),
                        border:
                            Border.all(color: appointmentTimeColor, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 70 * screenWidth),
                  ChargePerItem(),
                ],
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItemDropDown(
                selectedOptions: selectedExpertiseList,
                title: 'Level of Expertise',
                hintText: 'Choose only one...',
                listName: expertiseList,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
