import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Icon(
          Icons.arrow_back_ios,
          color: primary,
        ),
      ),
    );
  }
}
