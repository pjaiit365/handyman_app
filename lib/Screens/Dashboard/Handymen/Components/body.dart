import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_app/Components/search_bar_item.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/carousel_item.dart';
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
            SearchBarItem(hintText: 'Search personnel: painters, etc.'),
            SizedBox(height: screenHeight * 30),
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return CarouselItem(index: index);
              },
              options: CarouselOptions(
                viewportFraction: 0.88,
                height: 176 * screenHeight,
                // viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
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
