import 'package:flutter/material.dart';
import 'package:handyman_app/Components/rating_bar.dart';

import '../constants.dart';

class OverallRating extends StatelessWidget {
  const OverallRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 20 * screenHeight,
          top: 25 * screenHeight,
          left: 15 * screenWidth,
          right: 10 * screenWidth),
      height: 122 * screenHeight,
      width: 353 * screenWidth,
      decoration: BoxDecoration(
        color: sectionColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '4.9',
                    style: TextStyle(
                        color: primary,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 11 * screenWidth),
                  Image.asset('assets/icons/5-Star.png'),
                ],
              ),
              SizedBox(height: 10 * screenHeight),
              Text(
                '(' + '444' + ' reviews)',
                style: TextStyle(
                    color: chatTimeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 5.0),
            child: Center(
              child: SizedBox(
                width: 159 * screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListView.builder(
                      itemCount: ratingsWidth.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return RatingBar(width: ratingsWidth[index]);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
