import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Job Deatils/Components/body.dart';
import 'package:handyman_app/constants.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        elevation: 0.0,
        backgroundColor: white,
        title: Text(
          'Job Details',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
