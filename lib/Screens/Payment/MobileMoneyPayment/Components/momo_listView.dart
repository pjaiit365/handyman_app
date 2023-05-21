import 'package:flutter/material.dart';

import '../../../../Components/profile_item.dart';
import '../../../../Components/profile_item_dropdown.dart';
import '../../../../constants.dart';

class MomoListView extends StatelessWidget {
  const MomoListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 15.5,
        vertical: 15 * screenHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 5.0),
            child: Text(
              'Service Provider',
              style: TextStyle(
                color: black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 9 * screenHeight),
          Container(
            constraints: BoxConstraints(minHeight: 170.26),
            width: 359 * screenWidth,
            decoration: BoxDecoration(
                color: sectionColor, borderRadius: BorderRadius.circular(13)),
            padding: EdgeInsets.symmetric(
                horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/mobile_money.png',
                      height: 87 * screenHeight, width: 138.13 * screenWidth),
                ),
                ChargePerItem(
                  // hintText: 'MTN Mobile Money',
                  title: 'Options',
                  listName: momoListOptions,
                  width: 310,
                )
              ],
            ),
          ),
          SizedBox(height: 25 * screenHeight),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 5.0),
            child: Text(
              'Transactional Details',
              style: TextStyle(
                color: black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 9 * screenHeight),
          Container(
            constraints: BoxConstraints(minHeight: 412),
            width: 359 * screenWidth,
            decoration: BoxDecoration(
                color: sectionColor, borderRadius: BorderRadius.circular(13)),
            padding: EdgeInsets.symmetric(
                horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileItem(
                  title: "Recipient's Number",
                  hintText: 'Enter number here...',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20 * screenHeight),
                ProfileItem(
                  title: "Confirm Number",
                  hintText: "Re-enter recipient's number here...",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20 * screenHeight),
                ProfileItem(
                  title: "Amount",
                  hintText: "Enter amount here...",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20 * screenHeight),
                ProfileItem(
                  title: "Reference",
                  hintText: "Enter reference...",
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
