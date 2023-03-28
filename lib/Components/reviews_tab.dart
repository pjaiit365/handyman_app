import 'package:flutter/material.dart';
import 'package:handyman_app/Components/rating_item.dart';

import '../constants.dart';
import 'overall_rating.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 5.0, bottom: 10 * screenHeight),
            child: Text(
              'Ratings',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          OverallRating(),
          SizedBox(height: 10 * screenHeight),
          ListView.separated(
            itemCount: ratingNames.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RatingItem(
                starsGiven: ratingStars[index],
                name: ratingNames[index],
                comment: ratingComment[index],
                isCommentLiked: isCommentLiked[index],
                timePosted: ratingTimePosted[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 11 * screenHeight);
            },
          ),
        ],
      ),
    );
  }
}
