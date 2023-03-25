import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_app/Screens/Dashboard/Handymen/Components/body.dart';
import 'package:handyman_app/constants.dart';

class HandymanDashboardScreen extends StatefulWidget {
  const HandymanDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HandymanDashboardScreen> createState() =>
      _HandymanDashboardScreenState();
}

class _HandymanDashboardScreenState extends State<HandymanDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 14.0),
            child: Image.asset(
              'assets/images/menu.png',
              color: primary,
            )),
        elevation: 0.0,
        backgroundColor: white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: screenWidth * 20),
            height: screenHeight * 50,
            width: screenWidth * 50,
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
