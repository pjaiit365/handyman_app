import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../Jobs/Components/body.dart';

class JobsDashboardScreen extends StatefulWidget {
  const JobsDashboardScreen({Key? key}) : super(key: key);

  @override
  State<JobsDashboardScreen> createState() => _JobsDashboardScreenState();
}

class _JobsDashboardScreenState extends State<JobsDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 14.0),
            child: Image.asset(
              'assets/icons/menu.png',
              color: primary,
            )),
        elevation: 0.0,
        backgroundColor: white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: screenWidth * 20),
            height: screenHeight * 40,
            width: screenWidth * 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile_pic.jpeg'),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
