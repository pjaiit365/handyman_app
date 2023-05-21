import 'package:flutter/material.dart';
import 'package:handyman_app/Components/pinned_button.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobCompleted/job_completed_screen.dart';

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
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return JobDetailsAndStatus(
                buttonText: 'See Location',
                isJobInProgessScreen: true,
                screen: JobCompletedScreen(),
                isJobInProgressActive: true,
              );
            },
          ),
        ),
        PinnedButton(
          screen: JobCompletedScreen(),
          buttonText: 'Job Complete',
          isIconPresent: true,
        )
      ],
    );
  }
}
