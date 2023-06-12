import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Job%20Upload/Handyman/Components/body.dart';

import '../../../Components/default_back_button.dart';
import '../../../constants.dart';

class HandymanJobUploadScreen extends StatelessWidget {
  const HandymanJobUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        title: Text(
          'Job Upload',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: Body(),
    );
  }
}
