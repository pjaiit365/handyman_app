import 'package:flutter/material.dart';

import '../../../../Components/profile_item.dart';
import '../../../../Components/profile_item_dropdown.dart';
import '../../../../constants.dart';
import '../../MobileMoneyPayment/Components/momo_listView.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSaveDetailsClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
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
                      color: sectionColor,
                      borderRadius: BorderRadius.circular(13)),
                  padding: EdgeInsets.symmetric(
                      horizontal: 23 * screenWidth,
                      vertical: 22 * screenHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.asset('assets/images/credit_card.png',
                            height: 87 * screenHeight,
                            width: 138.13 * screenWidth),
                      ),
                      ChargePerItem(
                        // hintText: 'MTN Mobile Money',
                        title: 'Options',
                        listName: creditCardList,
                        width: 310,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25 * screenHeight),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 5.0),
                  child: Text(
                    'Card Details',
                    style: TextStyle(
                      color: black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 9 * screenHeight),
                Container(
                  constraints: BoxConstraints(minHeight: 280),
                  width: 359 * screenWidth,
                  decoration: BoxDecoration(
                      color: sectionColor,
                      borderRadius: BorderRadius.circular(13)),
                  padding: EdgeInsets.symmetric(
                      horizontal: 23 * screenWidth,
                      vertical: 22 * screenHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileItem(
                        imageAssetLocation: 'assets/icons/credit_card.png',
                        isCreditCard: true,
                        title: 'Card Number',
                        hintText: 'Enter card number here...',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20 * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileItem(
                            title: 'Expiry Date',
                            hintText: 'DD/MM/YYYY',
                            keyboardType: TextInputType.datetime,
                            isWidthMax: false,
                            width: 174,
                          ),
                          SizedBox(width: 20 * screenWidth),
                          ProfileItem(
                            isInputObscured: true,
                            title: 'CVV/CVC',
                            hintText: 'CVV/CVC',
                            keyboardType: TextInputType.number,
                            isWidthMax: false,
                            width: 116,
                          ),
                        ],
                      ),
                      SizedBox(height: 25 * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSaveDetailsClicked = !isSaveDetailsClicked;
                              });
                            },
                            child: Container(
                              height: 20 * screenHeight,
                              width: 20 * screenWidth,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                    color: appointmentTimeColor, width: 1),
                              ),
                              alignment: Alignment.center,
                              child: isSaveDetailsClicked
                                  ? Container(
                                      height: 16 * screenHeight,
                                      width: 16 * screenWidth,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        // borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      )),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(width: 12 * screenWidth),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 2.0),
                            child: Text(
                              'Save card payment information to my \naccount for future transactions.',
                              style: TextStyle(
                                height: 1.2,
                                color: black,
                                fontSize: 15,
                                fontFamily: 'Inter',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
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
            child: Center(
                child: Text(
              'Proceed',
              style: TextStyle(
                color: white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
