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
              return JobDetailsAndStatus(
                isJobCompletedAcitve: true,
                isJobPendingActive: false,
                screen: JobInProgressScreen(),
                isJobOfferScreen: false,
                statusText: 'Job Accepted',
                imageLocation: allJobCompleted[selectedJob].pic,
                name: allJobCompleted[selectedJob].name,
                region: allJobCompleted[selectedJob].region,
                chargeRate: allJobCompleted[selectedJob].chargeRate,
                charge: allJobCompleted[selectedJob].charge,
                street: allJobCompleted[selectedJob].street,
                town: allJobCompleted[selectedJob].town,
                houseNum: allJobCompleted[selectedJob].houseNum,
                jobType: allJobCompleted[selectedJob].serviceProvided,
                date: allJobCompleted[selectedJob].date,
              );
            },
          ),
        ),
        PinnedButton(
          screen: PaymentOptionsScreen(),
          buttonText: 'Request Payment',
          isIconPresent: true,
        ),
      ],
    );
  }
}
