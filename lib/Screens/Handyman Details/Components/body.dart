import 'package:flutter/material.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/about_tab.dart';
import '../../../Components/contact_personnel_button.dart';
import '../../../Components/personnel_details_tab.dart';
import '../../../Components/section_tabs.dart';
import '../../../Components/services_tab.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: FixedExtentScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PersonnelDetailsTab(),
          SizedBox(height: 23 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ContactPersonnelButton(
                call: true,
                press: () {},
              ),
              ContactPersonnelButton(
                call: false,
                press: () {},
              ),
            ],
          ),
          SizedBox(height: 22 * screenHeight),
          SectionTabs(),
          SizedBox(height: screenHeight * 23),
          // if (aboutSelected == true) AboutTab(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 5.0, bottom: 10 * screenHeight),
                  child: Text(
                    'Ratings',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20 * screenHeight),
                  height: 122 * screenHeight,
                  width: 353 * screenWidth,
                  decoration: BoxDecoration(
                    color: sectionColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '4.9',
                                style: TextStyle(
                                    color: primary,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: 11 * screenWidth),
                              Image.asset('assets/icons/5-Star.png'),
                            ],
                          ),
                          SizedBox(height: 10 * screenHeight),
                          Text(
                            '(' + '444' + ' reviews)',
                            style: TextStyle(
                                color: chatTimeColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListView.builder(
                              itemCount: ratingsWidth.length,
                              shrinkWrap: true,
                              // primary: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RatingBar(width: ratingsWidth[index]);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double width;
  const RatingBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 6.0),
        child: Container(
          height: 5 * screenHeight,
          width: 159 * screenWidth,
          color: grey,
          child: Container(
            width: width * screenWidth,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}
