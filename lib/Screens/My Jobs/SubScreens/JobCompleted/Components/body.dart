// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Payment/PaymentOptions/payment_options_screen.dart';

import '../../../../../Components/job_details_and_status.dart';
import '../../../../../Components/pinned_button.dart';
import '../../../../../Services/read_data.dart';
import '../../../../../constants.dart';
import '../../JobInProgress/job_in_progress_screen.dart';

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
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return moreOffers[selectedJob].whoApplied == 'Customer'
                  ? JobDetailsAndStatus(
                      isJobCompletedAcitve: true,
                      isJobPendingActive: false,
                      screen: JobInProgressScreen(),
                      isJobOfferScreen: false,
                      statusText: 'Job Completed',
                      imageLocation: allJobCompleted[selectedJob].pic,
                      name: allJobCompleted[selectedJob].name,
                      region: moreOffers[selectedJob].region,
                      chargeRate: allJobCompleted[selectedJob].chargeRate,
                      charge: allJobCompleted[selectedJob].charge,
                      street: moreOffers[selectedJob].street,
                      town: moreOffers[selectedJob].town,
                      houseNum: moreOffers[selectedJob].houseNum,
                      jobType: allJobCompleted[selectedJob].serviceProvided,
                      date: moreOffers[selectedJob].date,
                    )
                  : JobDetailsAndStatus(
                      isJobCompletedAcitve: true,
                      isJobPendingActive: false,
                      screen: JobInProgressScreen(),
                      isJobOfferScreen: false,
                      statusText: 'Job Completed',
                      imageLocation: moreOffers[selectedJob].pic,
                      name: moreOffers[selectedJob].name,
                      region: allJobCompleted[selectedJob].region,
                      chargeRate: allJobCompleted[selectedJob].chargeRate,
                      charge: allJobCompleted[selectedJob].charge,
                      street: moreOffers[selectedJob].street,
                      town: allJobCompleted[selectedJob].town,
                      houseNum: allJobCompleted[selectedJob].houseNum,
                      jobType: allJobCompleted[selectedJob].serviceProvided,
                      date: moreOffers[selectedJob].date,
                    );
            },
          ),
        ),
        moreOffers[selectedJob].jobStatus == 'Paid'
            ? SizedBox()
            : PinnedButton(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentOptionsScreen(),
                    ),
                  );
                },
                screen: PaymentOptionsScreen(),
                buttonText: 'Make Payment',
                isIconPresent: true,
              ),
      ],
    );
  }
}
