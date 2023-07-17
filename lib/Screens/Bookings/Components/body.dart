import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Bookings/Components/job_bookings_tabs.dart';

import '../../../constants.dart';
import '../../My Jobs/Components/my_job_items.dart';
import '../../My Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import '../../My Jobs/SubScreens/JobOffer/job_offer_screen.dart';
import '../../My Jobs/SubScreens/JobUpcoming/job_upcoming.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15 * screenHeight),
        JobBookingsTab(
          upcomingCallback: () {
            setState(() {
              isJobUpcomingClicked = !isJobUpcomingClicked;
            });
            if (isJobUpcomingClicked == true) {
              isJobCompletedClicked = false;
              isJobOffersClicked = false;
            }
            if (isJobCompletedClicked == false && isJobOffersClicked == false)
              isJobUpcomingClicked = true;
          },
          offersCallback: () {
            setState(() {
              isJobOffersClicked = !isJobOffersClicked;
            });
            if (isJobOffersClicked == true) {
              isJobCompletedClicked = false;
              isJobUpcomingClicked = false;
            }
            if (isJobCompletedClicked == false && isJobUpcomingClicked == false)
              isJobOffersClicked = true;
          },
          completedCallback: () {
            setState(() {
              isJobCompletedClicked = !isJobCompletedClicked;
            });
            if (isJobCompletedClicked == true) {
              isJobUpcomingClicked = false;
              isJobOffersClicked = false;
            }
            if (isJobUpcomingClicked == false && isJobOffersClicked == false)
              isJobCompletedClicked = true;
          },
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
