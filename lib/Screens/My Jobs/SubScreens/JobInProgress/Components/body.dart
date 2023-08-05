// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/pinned_button.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import 'package:handyman_app/Services/read_data.dart';

import '../../../../../Components/job_details_and_status.dart';
import '../../../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return JobDetailsAndStatus(
                buttonText: 'See Location',
                isJobInProgessScreen: true,
                screen: JobCompletedScreen(),
                isJobInProgressActive: true,
                imageLocation: allJobUpcoming[selectedJob].pic,
                name: allJobUpcoming[selectedJob].name,
                region: allJobUpcoming[selectedJob].region,
                chargeRate: allJobUpcoming[selectedJob].chargeRate,
                charge: allJobUpcoming[selectedJob].charge,
                street: allJobUpcoming[selectedJob].street,
                town: allJobUpcoming[selectedJob].town,
                houseNum: allJobUpcoming[selectedJob].houseNum,
                jobType: allJobUpcoming[selectedJob].serviceProvided,
                date: moreOffers[selectedJob].date,
              );
            },
          ),
        ),
        PinnedButton(
          function: () async {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 150 * screenWidth),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      (Platform.isIOS)
                          ? const CupertinoActivityIndicator(
                              radius: 20,
                              color: Color(0xff32B5BD),
                            )
                          : const CircularProgressIndicator(
                              color: Color(0xff32B5BD),
                            ),
                    ],
                  ),
                );
              },
            );
            await ReadData().completeJob();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FutureBuilder(
                  future: ReadData().getUpcomingJobData(
                      'Jobs Completed', 'Customer', context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return JobCompletedScreen();
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
                  },
                ),
              ),
            );
          },
          buttonText: 'Job Complete',
          isIconPresent: true,
        )
      ],
    );
  }
}
