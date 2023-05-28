import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/wrapper.dart';

import '../../../constants.dart';
import '../../Welcome/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenCont extends StatelessWidget {
  const SplashScreenCont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 700,
        splash: Image.asset(
          'assets/images/app_logo.png',
          color: white,
        ),
        nextScreen: Wrapper(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        duration: 3000,
        backgroundColor: primary,
      ),
    );
  }
}
