import 'package:flutter/material.dart';
import 'package:handyman_app/Components/appointment_static_time.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/address_bars.dart';
import '../../../Components/appointment_button.dart';
import '../../../Components/appointment_date.dart';
import '../../../Components/appointment_tab_row.dart';
import '../../../Components/personnel_info_summary.dart';
import '../../../Components/personnel_rating_summary.dart';
import '../../../Components/schedule_address.dart';
import '../../../Components/schedule_day_tab.dart';
import '../../../Components/schedule_note.dart';
import '../../../Components/schedule_time_tab.dart';
import '../../../Components/summary_details.dart';
import '../../../Components/summary_element.dart';
import '../../Successful/booking_successful_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          scrollable: true,
          content: isSummaryClicked
              ? SummaryDetails()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SummaryDetails(),
                    SizedBox(height: 24 * screenHeight),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingSuccessfulScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 49 * screenHeight,
                        width: 312 * screenWidth,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: sectionColor, width: 3)),
                        child: Center(
                          child: Text(
                            'Schedule',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 23 * screenHeight),
          Center(
            child: Container(
              height: 92 * screenHeight,
              width: 87.65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_pic.jpeg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 10 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Harry Garett',
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 11 * screenWidth),
              Icon(
                Icons.verified_rounded,
                size: 24.22,
                color: green,
              ),
            ],
          ),
          SizedBox(height: 24 * screenHeight),
          PersonnelInfoSummary(),
          SizedBox(height: 23 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppointmentButton(
                text: 'Schedule',
                containerColor: primary,
                textColor: white,
                press: () {
                  setState(() {
                    isSummaryClicked = false;
                  });
                  _showSummaryDialog();
                },
              ),
              SizedBox(width: 3 * screenWidth),
              AppointmentButton(
                text: 'Summary',
                containerColor: sectionColor,
                textColor: textGreyColor,
                press: () {
                  setState(() {
                    isSummaryClicked = true;
                  });
                  _showSummaryDialog();
                },
              ),
            ],
          ),
          SizedBox(height: 23 * screenHeight),
          ScheduleDayTab(),
          SizedBox(height: 10 * screenHeight),
          ScheduleTimeTab(),
          SizedBox(height: 10 * screenHeight),
          ScheduleAddress(),
          SizedBox(height: 10 * screenHeight),
          ScheduleNote(),
          SizedBox(height: 10 * screenHeight),
        ],
      ),
    );
  }
}
