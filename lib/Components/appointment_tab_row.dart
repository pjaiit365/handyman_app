import 'package:flutter/material.dart';

import '../constants.dart';

class AppointmentTabRow extends StatelessWidget {
  bool isCustomVisible;
  final String tabTitle;
  AppointmentTabRow({
    Key? key,
    required this.tabTitle,
    this.isCustomVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          tabTitle,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 31 * screenHeight,
            width: 30 * screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: white,
                border: Border.all(
                  color: primary,
                  width: 2,
                )),
            child: Image.asset('assets/icons/info.png'),
          ),
        ),
        SizedBox(width: 10 * screenWidth),
        isCustomVisible
            ? Padding(
                padding: EdgeInsets.only(right: screenWidth * 8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 31 * screenHeight,
                    width: 80 * screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: white,
                        border: Border.all(
                          color: primary,
                          width: 2,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/icons/plus.png'),
                        Text(
                          'Custom',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(height: 0, width: 0),
      ],
    );
  }
}
