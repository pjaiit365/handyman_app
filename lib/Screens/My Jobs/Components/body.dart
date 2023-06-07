import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobOffer/job_offer_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/constants.dart';

import 'my_job_items.dart';
import 'my_jobs_tabs.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15 * screenHeight),
        MyJobsTabs(
          isJobCompletedClicked: isJobCompletedClicked,
          isJobOffersClicked: isJobOffersClicked,
          isJobUpcomingClicked: isJobUpcomingClicked,
        ),
        SizedBox(height: 25 * screenHeight),
        if (isJobUpcomingClicked == true)
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MyJobItems(
                  screen: JobUpcomingScreen(),
                  name: upcomingNameList[index],
                  imageLocation: upcomingImageLocation[index],
                  serviceCat: upcomingServices[index],
                  date: upcomingDateList[index],
                  time: upcomingTimeList[index],
                  orderStatus: upcomingOrderStatusList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20 * screenHeight,
                );
              },
              itemCount: upcomingOrderStatusList.length),
        if (isJobOffersClicked == true)
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MyJobItems(
                  screen: JobOfferScreen(),
                  name: offerNameList[index],
                  imageLocation: offerImageLocation[index],
                  serviceCat: offerServices[index],
                  date: offerDateList[index],
                  time: offerTimeList[index],
                  orderStatus: offerOrderStatusList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20 * screenHeight,
                );
              },
              itemCount: upcomingOrderStatusList.length),
        if (isJobCompletedClicked == true)
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MyJobItems(
                  screen: JobCompletedScreen(),
                  name: completedNameList[index],
                  imageLocation: completedImageLocation[index],
                  serviceCat: completedServices[index],
                  date: completedDateList[index],
                  time: completedTimeList[index],
                  orderStatus: completedOrderStatusList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20 * screenHeight,
                );
              },
              itemCount: upcomingOrderStatusList.length),
      ],
    );
  }
}
