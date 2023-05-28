import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/category_item.dart';
import '../../../../Components/dashboard_tab.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 12.0, vertical: screenHeight * 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBar(hintText: 'Search personnel: painters,etc.'),
            SizedBox(height: screenHeight * 30),
            Center(
              child: Container(
                height: screenHeight * 150,
                width: screenWidth * 305,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffEEFFF2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 20.0, top: screenHeight * 15),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: screenHeight * 15),
                          Text(
                            '25% OFF',
                            style: TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: screenHeight * 6),
                          Text(
                            'On the first cleaning service',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: screenHeight * 10),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 41 * screenHeight,
                              width: screenWidth * 134,
                              decoration: BoxDecoration(
                                color: Color(0xff48C945),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Book Now!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/repair_illustration.svg',
                        height: 90 * screenHeight,
                        width: 94 * screenWidth,
                        // fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 12.0, left: screenWidth * 8),
                  child: Text(
                    'Category',
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter'),
                  ),
                ),
                Spacer(),
                Image.asset('assets/icons/sort.png'),
              ],
            ),
            SizedBox(
              height: 48 * screenHeight,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10 * screenWidth),

                itemCount: dashBoardTabList.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => DashboardTab(
                  text: dashBoardTabList[index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: screenWidth * 15);
                },
              ),
            ),
            SizedBox(height: screenHeight * 25),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: handymanDashboardPrice.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  imageLocation: handymanDashboardImage[index],
                  jobType: handymanDashboardJobType[index],
                  name: handymanDashboardName[index],
                  price: handymanDashboardPrice[index],
                  rating: handymanDashboardRating[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: screenHeight * 20);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String hintText;
  const SearchBar({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: screenHeight * 53,
        width: 355 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffEBF6F9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: screenWidth * 20),
            Image.asset('assets/icons/search.png'),
            SizedBox(width: screenWidth * 20),
            Text(
              hintText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
