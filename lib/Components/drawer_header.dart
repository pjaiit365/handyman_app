import 'package:flutter/material.dart';

import '../constants.dart';
import 'default_back_button.dart';

class DrawerHeaderCreated extends StatelessWidget {
  const DrawerHeaderCreated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DefaultBackButton(),
        SizedBox(width: 15 * screenWidth),
        Container(
          height: 60 * screenHeight,
          width: 60 * screenWidth,
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/profile_pic.jpeg'),
            ),
          ),
        ),
        SizedBox(width: 15 * screenWidth),
        Text(
          '204 followers',
          style: TextStyle(
            color: black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
