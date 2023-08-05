import 'package:flutter/material.dart';
import 'package:handyman_app/Components/services_tab.dart';
import 'package:handyman_app/Services/read_data.dart';

import '../constants.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 5.0, bottom: 20 * screenHeight),
            child: Text(
              'Category',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          ServicesTab(text: allJobItemList[0].jobCategory),
          SizedBox(height: 5 * screenHeight),
          AdditionalInfo(text: 'Experience')
        ],
      ),
    );
  }
}
