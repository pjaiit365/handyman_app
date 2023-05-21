import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/constants.dart';

import '../../../../../Components/appointment_job_details.dart';
import '../../../../../Components/appointment_job_status.dart';
import '../../../../../Components/job_details_and_status.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: JobDetailsAndStatus(
          isJobPendingActive: true,
          screen: JobUpcomingScreen(),
          isJobOfferScreen: true),
    );
  }
}
