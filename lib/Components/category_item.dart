import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Handyman%20Details/handyman_details_screen.dart';

import '../constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/profile_pic.jpeg',
                      ),
                    )),
              ),
              VerticalDivider(thickness: 3.5, color: Colors.white),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 6.0, vertical: screenHeight * 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 5.0),
                      child: Text(
                        'Furniture Painting',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                      ),
                    ),
                    Text(
                      'By: ' + 'Harry Garret',
                      style: TextStyle(
                        fontSize: 14,
                        color: textGreyColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 20),
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
                        SizedBox(width: screenWidth * 100),
                        Text(
                          '\$' + '15/hr',
                          style: TextStyle(
                              fontSize: 19,
                              color: primary,
                              fontWeight: FontWeight.w800),
                        )
                      ],
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
