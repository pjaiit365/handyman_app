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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardTab(
                    backgroundColor: primary.withOpacity(0.81),
                    textColor: white,
                    text: 'Painter'),
                DashboardTab(
                    backgroundColor: tabLight,
                    textColor: Colors.black,
                    text: 'Electrician'),
                DashboardTab(
                    backgroundColor: tabLight,
                    textColor: Colors.black,
                    text: 'Carpenter')
              ],
            ),
            SizedBox(height: screenHeight * 25),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return JobCategoryItem(status: statusOptions[index]);
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
