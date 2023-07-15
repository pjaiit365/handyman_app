// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Job%20Application/Components/application_references_tab.dart';
import 'package:handyman_app/Screens/Job%20Application/Components/application_summary_details.dart';
import 'package:handyman_app/Services/read_data.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/appointment_button.dart';
import 'application_portfolio_tab.dart';
import 'appointment_charge_details.dart';
import '../../../Components/appointment_tab_row.dart';
import '../../../Components/schedule_address.dart';
import '../../../Components/schedule_day_tab.dart';
import '../../../Components/schedule_note.dart';
import '../../../Components/schedule_time_tab.dart';
import '../../../Components/summary_details.dart';
import '../../Successful/booking_successful_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final notesController = TextEditingController();

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    notesController.text = '';
    super.initState();
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          scrollable: true,
          content: isSummaryClicked
              ? ApplicationSummaryDetails()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ApplicationSummaryDetails(),
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
                            'Apply',
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
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20 * screenHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 92 * screenHeight,
                width: 87.65 * screenWidth,
                decoration: BoxDecoration(
                  color: sectionColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(allJobItemList[0].pic),
                  ),
                ),
                child: allJobItemList[0].pic == ''
                    ? Center(
                        child: Icon(
                        Icons.person,
                        color: white,
                        size: 42,
                      ))
                    : SizedBox(),
              ),
              SizedBox(height: 10 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        minWidth: 1 * screenWidth, maxWidth: 300 * screenWidth),
                    child: Text(
                      allJobItemList[0].fullName,
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.4),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(width: 13 * screenWidth),
                  Icon(
                    Icons.verified_rounded,
                    color: green,
                  ),
                ],
              ),
              SizedBox(height: 14.78 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Applying for: ',
                    style: TextStyle(
                      color: black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5 * screenWidth),
                  Container(
                    constraints: BoxConstraints(
                        minWidth: 1 * screenWidth, maxWidth: 170 * screenWidth),
                    child: Text(
                      allJobItemList[0].jobService,
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppointmentButton(
                text: 'Apply',
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
          ApplicationChargeDetails(),
          SizedBox(height: 10 * screenHeight),
          ScheduleDayTab(),
          SizedBox(height: 10 * screenHeight),
          ScheduleTimeTab(),
          SizedBox(height: 10 * screenHeight),
          ScheduleAddress(),
          SizedBox(height: 10 * screenHeight),
          ScheduleNote(),
          allJobItemList[0].isPortfolioPresent
              ? SizedBox(height: 10 * screenHeight)
              : SizedBox(),
          allJobItemList[0].isPortfolioPresent
              ? ApplicationPortfolioTab()
              : SizedBox(),
          allJobItemList[0].isReferencesPresent
              ? SizedBox(height: 10 * screenHeight)
              : SizedBox(),
          allJobItemList[0].isReferencesPresent
              ? ApplicationReferencesTab()
              : SizedBox(),
          SizedBox(height: 25 * screenHeight),
        ],
      ),
    );
  }
}
