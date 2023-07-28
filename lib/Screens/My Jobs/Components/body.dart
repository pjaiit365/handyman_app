import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/offers_and_widgets_alt.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobApplied/job_applied_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobOffer/job_offer_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/Services/read_data.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/offers_and_widgets.dart';
import 'my_job_items.dart';
import 'my_jobs_tabs.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ReadData readData = ReadData();

  Future allData() async {
    if (isJobOffersClicked == true) {
      await readData.getCustomerJobApplicationData('Job Offers', 'Handyman');
      await readData.getHandymanJobApplicationData('Jobs Applied', 'Handyman');
    }
    if (isJobUpcomingClicked == true) {
      await readData.getHandymanJobApplicationData('Jobs Upcoming', 'Handyman');
    }
    if (isJobCompletedClicked == true) {
      await readData.getHandymanJobApplicationData(
          'Jobs Completed', 'Handyman');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: allData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15 * screenHeight),
                  MyJobsTabs(
                    upcomingCallback: () {
                      setState(() {
                        isJobUpcomingClicked = !isJobUpcomingClicked;
                      });
                      if (isJobUpcomingClicked == true) {
                        isJobCompletedClicked = false;
                        isJobOffersClicked = false;
                      }
                      if (isJobCompletedClicked == false &&
                          isJobOffersClicked == false)
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
                      if (isJobCompletedClicked == false &&
                          isJobUpcomingClicked == false)
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
                      if (isJobUpcomingClicked == false &&
                          isJobOffersClicked == false)
                        isJobCompletedClicked = true;
                    },
                  ),
                  SizedBox(height: 25 * screenHeight),
                  if (isJobUpcomingClicked == true)
                    allJobUpcoming.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MyJobItems(
                                index: index,
                                screen: JobUpcomingScreen(),
                                name: allJobUpcoming[index].name,
                                imageLocation: allJobUpcoming[index].pic,
                                serviceCat:
                                    allJobUpcoming[index].serviceProvided,
                                date: allJobUpcoming[index].uploadDate,
                                time: allJobUpcoming[index].uploadTime,
                                orderStatus: upcomingOrderStatusList[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20 * screenHeight,
                              );
                            },
                            itemCount: allJobUpcoming.length)
                        : Center(
                            child: Text(
                              'No upcoming jobs.',
                              style: TextStyle(
                                color: primary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  if (isJobOffersClicked == true)
                    (allJobOffers.isEmpty && allJobApplied.isEmpty)
                        ? Center(
                            child: Text(
                              'No job offers available.',
                              style: TextStyle(
                                color: primary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : OffersAndAppliedWidgetAlt(),
                  if (isJobCompletedClicked == true)
                    allJobCompleted.isEmpty
                        ? Center(
                            child: Text(
                              'No jobs completed.',
                              style: TextStyle(
                                color: primary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MyJobItems(
                                index: index,
                                screen: JobCompletedScreen(),
                                name: allJobCompleted[index].name,
                                imageLocation: allJobCompleted[index].pic,
                                serviceCat:
                                    allJobCompleted[index].serviceProvided,
                                date: allJobCompleted[index].uploadDate,
                                time: allJobCompleted[index].uploadTime,
                                orderStatus: completedOrderStatusList[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20 * screenHeight,
                              );
                            },
                            itemCount: allJobCompleted.length),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator(color: primary)
                  : CircularProgressIndicator(color: primary),
            );
          }
          return Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator(color: primary)
                : CircularProgressIndicator(color: primary),
          );
        });
  }
}
