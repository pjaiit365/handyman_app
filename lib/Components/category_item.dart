import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Handyman%20Details/handyman_details_screen.dart';

import '../constants.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  bool isFavouriteSelected;
  final String jobType;
  final String name;
  final String rating;
  final String price;
  final String imageLocation;
  CategoryItem({
    Key? key,
    this.isFavouriteSelected = false,
    required this.index,
    required this.jobType,
    required this.name,
    required this.rating,
    required this.price,
    required this.imageLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HandymanDetailsScreen(),
            ),
          );
          handymanSelectedIndex = index;
        },
        child: Container(
          height: 123 * screenHeight,
          width: 362 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: tabLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 123 * screenHeight,
                width: 115 * screenWidth,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imageLocation,
                    ),
                  ),
                ),
              ),
              VerticalDivider(thickness: 3.5, color: Colors.white),
              Padding(
                padding: isFavouriteSelected
                    ? EdgeInsets.only(
                        left: 6 * screenWidth,
                        right: 6 * screenWidth,
                        bottom: 10 * screenHeight,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: screenWidth * 6.0,
                        vertical: screenHeight * 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    isFavouriteSelected
                        ? SizedBox(
                            width: 212 * screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '',
                                  textDirection: TextDirection.rtl,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.bookmark,
                                  color: chatBlue,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Padding(
                      padding: isFavouriteSelected
                          ? EdgeInsets.only(top: 0 * screenHeight)
                          : EdgeInsets.symmetric(vertical: screenHeight * 5.0),
                      child: SizedBox(
                        width: 190 * screenWidth,
                        child: Text(
                          jobType,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: black,
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180 * screenWidth,
                      child: Text(
                        'By: ' + name,
                        style: TextStyle(
                          fontSize: 14,
                          color: textGreyColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: screenHeight * 20),
                    SizedBox(
                      width: 210 * screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 2.0,
                                right: 3 * screenWidth),
                            child: Image.asset('assets/icons/gold_star.png'),
                          ),
                          Text(
                            '(' + rating + ')',
                            style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Spacer(),
                          Text(
                            '\$' + price,
                            style: TextStyle(
                                fontSize: 19,
                                color: primary,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
