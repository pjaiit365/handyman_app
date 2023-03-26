import 'package:flutter/material.dart';

import '../constants.dart';

class PersonnelDetailsTab extends StatelessWidget {
  const PersonnelDetailsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194 * screenHeight,
      width: 390 * screenWidth,
      decoration: BoxDecoration(
        color: sectionColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0 * screenHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 97 * screenHeight,
                width: 87.65 * screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/profile_pic.jpeg'),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 36 * screenHeight),
                Text(
                  'Harry Garett',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: black),
                ),
                SizedBox(height: 11 * screenHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 2.0, right: 3 * screenWidth),
                      child: Image.asset('assets/icons/gold_star.png'),
                    ),
                    Text(
                      '(4.9)',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    SizedBox(width: 4 * screenWidth),
                    Text(
                      'rating(s)',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: black),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 11),
                Text(
                  '149.5 km',
                  style: TextStyle(
                      color: black, fontSize: 19, fontWeight: FontWeight.w700),
                ),
                Text(
                  'away from you',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300, color: black),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 40.0),
                  child: Container(
                    height: 4 * screenHeight,
                    width: 59 * screenWidth,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(6)),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '\$' + '15/hr',
                    style: TextStyle(
                        color: primary,
                        fontSize: 27.64,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15 * screenHeight),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 47 * screenHeight,
                      width: 109 * screenWidth,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Book Now!',
                          style: TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
