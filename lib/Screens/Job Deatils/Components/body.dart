import 'package:flutter/material.dart';
import 'package:handyman_app/Components/about_tab.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/job_details_essentials_container.dart';
import '../../../Components/portfolio_tab.dart';
import '../../Appointment/appointment_screen.dart';
import 'job_details_tab.dart';
import 'job_summary.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          JobSummary(),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              JobDetailsEssentialsContainer(
                title: 'People Applied',
                subtitle: '22',
              ),
              JobDetailsEssentialsContainer(
                title: 'Deadline',
                subtitle: '22-04-2023',
              ),
            ],
          ),
          SizedBox(height: 24 * screenHeight),
          JobDetailsTab(),
          SizedBox(height: 16 * screenHeight),
          if (isJobAboutClicked == true) AboutTab(),
          if (isJobPortfolioClicked == true) PortfolioTab(),
        ],
      ),
    );
  }
}
