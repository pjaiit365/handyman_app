import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Payment/MobileMoneyPayment/Components/body.dart';
import 'package:handyman_app/constants.dart';

class MobileMoneyPayment extends StatelessWidget {
  const MobileMoneyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        title: Text(
          'Mobile Money Transaction',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: white,
        elevation: 0.0,
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
