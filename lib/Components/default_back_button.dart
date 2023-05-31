import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: tabLight,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Padding(
        padding: EdgeInsets.only(left: screenWidth * 12.0),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: primary,
          weight: 15,
        ),
      ),
    );
  }
}
