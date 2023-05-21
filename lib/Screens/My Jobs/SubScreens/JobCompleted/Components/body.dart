import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Payment/PaymentOptions/payment_options_screen.dart';

import '../../../../../Components/job_details_and_status.dart';
import '../../../../../Components/pinned_button.dart';
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
