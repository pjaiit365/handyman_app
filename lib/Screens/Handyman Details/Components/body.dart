import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Chat/chat_alternate_screen.dart';
import 'package:handyman_app/Screens/Chat/chat_screen.dart';
import 'package:handyman_app/constants.dart';
import '../../../Components/contact_personnel_button.dart';

import '../../../Components/personnel_details_tab.dart';
import '../../../Components/portfolio_tab.dart';
import '../../../Components/reviews_tab.dart';
import '../../../Components/about_tab.dart';
import '../../../Components/section_tabs.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatAlternateScreen(),
                    ),
                  );
                },
              ),
              ContactPersonnelButton(
                call: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 22 * screenHeight),
          SectionTabs(),
          SizedBox(height: screenHeight * 23),
          if (aboutSelected == true) AboutTab(),
          if (reviewsSelected == true) ReviewsTab(),
          if (portfolioSelected == true) PortfolioTab(),
        ],
      ),
    );
  }
}
