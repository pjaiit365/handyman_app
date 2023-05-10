import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';

import 'package:handyman_app/Screens/Appointment/Components/body.dart';
import 'package:handyman_app/Screens/Chat/chat_alternate_screen.dart';

import '../../constants.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        backgroundColor: white,
        title: Text(
          'Appointment',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          InkWell(
            highlightColor: sectionColor,
            borderRadius: BorderRadius.circular(24),
            onTap: () {},
            child: Image.asset('assets/icons/call.png', color: primary),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              highlightColor: sectionColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatAlternateScreen(),
                  ),
                );
              },
              child: Image.asset('assets/icons/message.png', color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Body(),
    );
  }
}
