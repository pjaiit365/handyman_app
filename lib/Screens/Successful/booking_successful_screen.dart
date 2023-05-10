import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';

import '../../constants.dart';
import '../Successful/Components/body.dart';

class BookingSuccessfulScreen extends StatelessWidget {
  const BookingSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: white)),
        backgroundColor: primary,
        elevation: 0.0,
      ),
      backgroundColor: primary,
      body: Body(),
    );
  }
}
