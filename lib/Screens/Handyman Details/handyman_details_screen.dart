import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Handyman Details/Components/body.dart';
import 'package:handyman_app/constants.dart';

class HandymanDetailsScreen extends StatelessWidget {
  const HandymanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        elevation: 0.0,
        backgroundColor: white,
        title: Text(
          'Personnel Details',
          style: TextStyle(
              color: black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
