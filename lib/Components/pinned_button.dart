import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Successful/booking_successful_screen.dart';

import '../constants.dart';

class PinnedButton extends StatelessWidget {
  Widget screen;
  String buttonText;
  bool isIconPresent;
  PinnedButton({
    Key? key,
    this.buttonText = 'Proceed',
    this.isIconPresent = false,
    this.screen = const BookingSuccessfulScreen(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              ));
        },
        child: Container(
          height: 56 * screenHeight,
          width: 390 * screenWidth,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            border: Border.all(color: white, width: 0.5),
          ),
          child: isIconPresent
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Image.asset(
                        'assets/icons/correct.png',
                        color: white,
                      ),
                      SizedBox(width: 9 * screenWidth),
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ])
              : Center(
                  child: Text(
                  buttonText,
                  style: TextStyle(
                    color: white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )),
        ),
      ),
    );
  }
}
