import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';

import '../../../../constants.dart';
import '../../../Registration/Sub Screen/Registration Continuation/Components/body.dart';

class RegistrationContinuationScreen extends StatelessWidget {
  const RegistrationContinuationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        title: Text(
          'Registration Continuation',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: white,
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: Body(),
    );
  }
}
