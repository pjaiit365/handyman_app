import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Welcome/Components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Body(),
      backgroundColor: white,
    );
  }
}
