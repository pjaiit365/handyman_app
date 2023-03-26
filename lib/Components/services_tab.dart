import 'package:flutter/material.dart';

import '../constants.dart';

class ServicesTab extends StatelessWidget {
  final String text;
  const ServicesTab({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0 * screenHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32 * screenWidth),
        height: 78 * screenHeight,
        width: 352 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                  color: black, fontWeight: FontWeight.w500, fontSize: 18),
            ),
            Image.asset('assets/icons/forward_arrow.png'),
          ],
        ),
      ),
    );
  }
}
