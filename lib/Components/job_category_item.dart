import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Job%20Deatils/job_details_screen.dart';

import '../constants.dart';

class JobCategoryItem extends StatelessWidget {
  final bool status;
  const JobCategoryItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobDetailsScreen(),
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
                      'By:' + 'Harry Garret',
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
                              top: screenHeight * 2.0, right: 5 * screenWidth),
                          child: status == true
                              ? Image.asset('assets/icons/green_valid.png')
                              : Image.asset('assets/icons/red_invalid.png'),
                        ),
                        status == true
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 3.0),
                                child: Text(
                                  'Valid',
                                  style: TextStyle(
                                      color: green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 2.0),
                                child: Text(
                                  'Invalid',
                                  style: TextStyle(
                                      color: red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                        SizedBox(width: screenWidth * 80),
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
