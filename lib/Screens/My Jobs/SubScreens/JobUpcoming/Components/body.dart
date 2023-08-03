// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/pinned_button.dart';
import 'package:handyman_app/Screens/Bookings/customer_bookings_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobInProgress/job_in_progress_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/Services/read_data.dart';

import '../../../../../Components/job_details_and_status.dart';
import '../../../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future startJob() async {
      final jobsAppliedID = moreOffers[selectedJob].documentID;
      if (moreOffers[selectedJob].whoApplied == 'Customer') {
        await FirebaseFirestore.instance
            .collection('Customer Jobs Applied')
            .doc(jobsAppliedID)
            .update(
          {'Job Status': 'Ongoing'},
        );
      } else {
        await FirebaseFirestore.instance
            .collection('Handyman Jobs Applied')
            .doc(jobsAppliedID)
            .update(
          {'Job Status': 'Ongoing'},
        );
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return moreOffers[selectedJob].whoApplied == 'Customer'
                  ? JobDetailsAndStatus(
                      declineFunction: () async {
                        await ReadData().deleteJobUpcoming('Customer Uploaded');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerBookingsScreen(),
                          ),
                        );
                      },
                      function: () {},
                      isJobPendingActive: true,
                      screen: JobInProgressScreen(),
                      isJobOfferScreen: true,
                      buttonText: 'Reschedule',
                      statusText: 'Job Accepted',
                      imageLocation: allJobUpcoming[selectedJob].pic,
                      name: allJobUpcoming[selectedJob].name,
                      region: moreOffers[selectedJob].region,
                      chargeRate: allJobUpcoming[selectedJob].chargeRate,
                      charge: allJobUpcoming[selectedJob].charge,
                      street: moreOffers[selectedJob].street,
                      town: moreOffers[selectedJob].town,
                      houseNum: moreOffers[selectedJob].houseNum,
                      jobType: allJobUpcoming[selectedJob].serviceProvided,
                      date: moreOffers[selectedJob].date,
                    )
                  : JobDetailsAndStatus(
                      declineFunction: () async {
                        await ReadData().deleteJobUpcoming('Handyman Uploaded');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerBookingsScreen(),
                          ),
                        );
                      },
                      isJobPendingActive: true,
                      screen: JobInProgressScreen(),
                      isJobOfferScreen: true,
                      buttonText: 'Reschedule',
                      statusText: 'Job Accepted',
                      imageLocation: moreOffers[selectedJob].pic,
                      name: moreOffers[selectedJob].name,
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
            await startJob();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JobInProgressScreen(),
              ),
            );
          },
          buttonText: 'Start',
          isIconPresent: true,
        ),
      ],
    );
  }
}
