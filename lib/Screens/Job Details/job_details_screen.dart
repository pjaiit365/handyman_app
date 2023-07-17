import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Job Details/Components/body.dart';
import 'package:handyman_app/constants.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  bool isJobBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        elevation: 0.0,
        backgroundColor: white,
        title: Text(
          'Job Details',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                isJobBookmarked = !isJobBookmarked;
              });
              if (isJobBookmarked == false) {
                handymanFavouritesImageList.removeAt(jobSelectedIndex);
                handymanFavouritesNameList.removeAt(jobSelectedIndex);
                handymanFavouritesChargeList.removeAt(jobSelectedIndex);
                handymanFavouritesStatusList.removeAt(jobSelectedIndex);
                handymanFavouritesJobTypeList.removeAt(jobSelectedIndex);
              }
              if (isJobBookmarked == true) {
                handymanFavouritesImageList
                    .add(jobDashboardImage[jobSelectedIndex]);
                handymanFavouritesNameList
                    .add(jobDashboardName[jobSelectedIndex]);
                handymanFavouritesChargeList
                    .add(jobDashboardPrice[jobSelectedIndex]);
                handymanFavouritesStatusList
                    .add(jobStatusOptions[jobSelectedIndex]);
                handymanFavouritesJobTypeList
                    .add(jobDashboardJobType[jobSelectedIndex]);
              }
            },
            icon: isJobBookmarked
                ? Icon(
                    Icons.bookmark,
                    color: chatBlue,
                  )
                : Icon(
                    Icons.bookmark,
                    color: semiGrey,
                  ),
          ),
          SizedBox(width: 18 * screenWidth),
        ],
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
