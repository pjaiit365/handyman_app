import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman_app/Components/job_category_item.dart';

import '../../../../Components/category_item.dart';
import '../../../../Components/dashboard_tab.dart';
import '../../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

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
            Center(
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
                      'Search personnel: painters,etc.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
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
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: jobDashboardPrice.length,
              itemBuilder: (context, index) {
                return JobCategoryItem(
                  index: index,
                  status: statusOptions[index],
                  name: jobDashboardName[index],
                  imageLocation: jobDashboardImage[index],
                  jobType: jobDashboardJobType[index],
                  price: jobDashboardPrice[index],
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
