import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';

import '../constants.dart';

class ProfilePaymentInformation extends StatelessWidget {
  const ProfilePaymentInformation({
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
            'Payment Information',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 9 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 382),
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
                isMomoOptions: true,
                selectedOptions: selectedMomoOptions,
                title: 'Mobile Money',
                hintText: 'Select all that apply...',
                listName: momoListOptions,
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(
                imageAssetLocation: 'assets/icons/credit_card.png',
                isCreditCard: true,
                title: 'Credit Card',
                hintText: 'Add any previous work here...',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 11 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(
                    isTitlePresent: false,
                    title: '',
                    hintText: 'DD/MM/YYYY',
                    keyboardType: TextInputType.datetime,
                    isWidthMax: false,
                    width: 174,
                  ),
                  SizedBox(width: 20 * screenWidth),
                  ProfileItem(
                    isInputObscured: true,
                    isTitlePresent: false,
                    title: '',
                    hintText: 'CVV/CVC',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 116,
                  ),
                ],
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(
                title: 'PayPal',
                hintText: 'Enter PayPal address...',
                keyboardType: TextInputType.emailAddress,
                isCreditCard: true,
                imageAssetLocation: 'assets/icons/pay_pal.png',
              ),
              SizedBox(height: 10 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
