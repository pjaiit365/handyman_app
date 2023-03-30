import 'package:flutter/material.dart';

import '../constants.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile_pic.jpeg'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 10.0, left: 13 * screenWidth),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 280 * screenWidth),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12 * screenWidth,
                      vertical: 14 * screenHeight),
                  decoration: BoxDecoration(
                    color: chatRed,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Reminder! Complete your task by the 15th. Please make sure to lock the door. Thank you',
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          style: TextStyle(
                            height: 1.3,
                            overflow: TextOverflow.ellipsis,
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 47.0,
              bottom: 10 * screenHeight,
              top: 8 * screenHeight),
          child: Text(
            '12:00 AM',
            style: TextStyle(
                color: chatTimeColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
