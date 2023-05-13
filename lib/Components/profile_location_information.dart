import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';
import 'package:handyman_app/Components/saved_addresses.dart';

import '../constants.dart';

class ProfileLocationInformation extends StatelessWidget {
  const ProfileLocationInformation({
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
            'Location',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 9 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 100),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItemAddAddress(
                title: 'Address',
                hintText: 'Add address here...',
              ),
              SizedBox(height: 12 * screenHeight),
              addressTownName.isEmpty
                  ? Center(
                      child: Text(
                        'No addresses added',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SavedAddresses(index: index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12 * screenHeight);
                      },
                      itemCount: addressTownName.length),
              SizedBox(height: 5 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
