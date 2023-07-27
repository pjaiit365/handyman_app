import 'package:flutter/material.dart';
import 'package:handyman_app/Components/search_bar_item.dart';
import '../../../Components/earlier_notifications.dart';
import '../../../Components/new_notifications.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.0 * screenWidth, vertical: 15 * screenHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 6.0),
              child: SearchBarItem(hintText: 'Search activity...'),
            ),
            SizedBox(height: 37 * screenHeight),
            NewNotifications(),
            SizedBox(height: 23 * screenHeight),
            EarlierNotifications(),
            SizedBox(height: 18 * screenHeight),
          ],
        ),
      ),
    );
  }
}
