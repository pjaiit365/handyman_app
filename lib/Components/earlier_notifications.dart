import 'package:flutter/material.dart';

import '../constants.dart';
import 'notification_item.dart';

class EarlierNotifications extends StatelessWidget {
  const EarlierNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 6.0),
          child: Text(
            'Earlier Notification',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 23 * screenHeight),
        Container(
          margin: EdgeInsets.only(left: 9 * screenWidth),
          height: 1 * screenHeight,
          width: 350 * screenWidth,
          color: grey,
        ),
        SizedBox(height: 23 * screenHeight),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return NotificationItem();
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 10 * screenHeight),
            itemCount: 3),
      ],
    );
  }
}
