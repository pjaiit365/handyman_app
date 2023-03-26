import 'package:flutter/material.dart';
import 'package:handyman_app/Components/services_tab.dart';

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
                left: screenWidth * 5.0, bottom: 10 * screenHeight),
            child: Text(
              'Services',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: servicesList.length,
            itemBuilder: (context, index) {
              return ServicesTab(text: servicesList[index]);
            },
          )
        ],
      ),
    );
  }
}
