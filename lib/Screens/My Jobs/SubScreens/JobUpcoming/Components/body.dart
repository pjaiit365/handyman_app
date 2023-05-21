import 'package:flutter/material.dart';
import 'package:handyman_app/Components/pinned_button.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobInProgress/job_in_progress_screen.dart';

import '../../../../../Components/job_details_and_status.dart';

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
                isJobPendingActive: true,
                screen: JobInProgressScreen(),
                isJobOfferScreen: true,
                buttonText: 'Reschedule',
                statusText: 'Job Accepted',
              );
            },
          ),
        ),
        PinnedButton(
          screen: JobInProgressScreen(),
          buttonText: 'Start',
          isIconPresent: true,
        ),
      ],
    );
  }
}
