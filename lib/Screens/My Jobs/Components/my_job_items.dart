import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobOffer/job_offer_screen.dart';

import '../../../constants.dart';

class MyJobItems extends StatelessWidget {
  final Widget screen;
  final String name;
  final String imageLocation;
  final String serviceCat;
  final String date;
  final String time;
  final String orderStatus;
  const MyJobItems({
    Key? key,
    required this.name,
    required this.imageLocation,
    required this.serviceCat,
    required this.date,
    required this.time,
    required this.orderStatus,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              ));
        },
        child: Container(
          height: 91 * screenHeight,
          width: 375 * screenWidth,
          decoration: BoxDecoration(
            color: sectionColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.only(
            left: 20 * screenWidth,
            top: 16 * screenHeight,
            bottom: 17 * screenHeight,
            right: 10 * screenWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 58 * screenHeight,
                width: 55.26 * screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.3),
                    image: DecorationImage(
                      image: AssetImage(imageLocation),
                      fit: BoxFit.fill,
                    )),
              ),
              // SizedBox(width: 21.74 * screenWidth),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 120 * screenWidth,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 3 * screenHeight),
                    SizedBox(
                      width: 120 * screenWidth,
                      child: Text(
                        serviceCat,
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 120 * screenWidth,
                      child: Text(
                        date + '||' + time,
                        style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 8 * screenHeight),
                    Text(
                      orderStatus,
                      style: TextStyle(
                        color: primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
