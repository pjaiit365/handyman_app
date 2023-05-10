import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String hintText;
  const ProfileItem({Key? key, required this.title, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            title,
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
        Container(
          height: 49 * screenHeight,
          width: 310 * screenWidth,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(7),
          ),
          //TODO: Remove underline under text when typing when WiFi come back and center cursor
          child: TextField(
            keyboardType: TextInputType.name,
            cursorHeight: 25 * screenHeight,
            cursorColor: black,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 15 * screenWidth, vertical: 15 * screenHeight),
            ),
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(
              color: black,
              fontSize: 16,
              overflow: TextOverflow.clip,
              // fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
