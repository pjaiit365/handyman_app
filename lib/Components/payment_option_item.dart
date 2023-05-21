import 'package:flutter/material.dart';

import '../constants.dart';

class PaymentOptionItem extends StatelessWidget {
  final Widget press;
  final String optionTitle;
  final String logoLocation;
  const PaymentOptionItem({
    Key? key,
    required this.optionTitle,
    required this.logoLocation,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => press,
          ),
        );
      },
      child: Container(
        height: 175 * screenHeight,
        width: 146 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(21),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.25),
              spreadRadius: 10.0,
              blurRadius: 10,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 32.0, bottom: 8.78 * screenHeight),
              child: Image.asset(
                logoLocation,
                width: 111.48 * screenWidth,
                height: 70.22 * screenHeight,
              ),
            ),
            Text(
              optionTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primary,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
