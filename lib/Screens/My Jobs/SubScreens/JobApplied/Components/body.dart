import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/Services/read_data.dart';
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
    print(allJobApplied[selectedJob].chargeRate);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: JobDetailsAndStatus(
        isJobAppliedScreen: true,
        buttonText: 'Edit',
        isJobPendingActive: true,
        screen: JobUpcomingScreen(),
        imageLocation: allJobApplied[selectedJob].pic,
        name: allJobApplied[selectedJob].name,
        region: allJobApplied[selectedJob].region,
        chargeRate: allJobApplied[selectedJob].chargeRate,
        charge: allJobApplied[selectedJob].charge,
        street: allJobApplied[selectedJob].street,
        town: allJobApplied[selectedJob].town,
        houseNum: allJobApplied[selectedJob].houseNum,
        jobType: allJobApplied[selectedJob].serviceProvided,
        date: allJobApplied[selectedJob].uploadDate,
      ),
    );
  }
}
