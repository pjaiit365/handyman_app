// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/appointment_static_time.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/appointment_button.dart';
import '../../../Components/personnel_info_summary.dart';
import '../../../Components/schedule_address.dart';
import '../../../Components/schedule_day_tab.dart';
import '../../../Components/schedule_note.dart';
import '../../../Components/schedule_time_tab.dart';
import '../../../Components/summary_details.dart';
import '../../../Services/read_data.dart';
import '../../Successful/Booking Successful/booking_successful_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void popDialog() {
    print(!jobCustomerAppliedIDs.contains(allJobItemList[0].jobID));
    print(jobCustomerAppliedIDs);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black45,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Center(
            child: Text(
              'One or more required fields has an error. Check them again.',
              style: TextStyle(height: 1.3),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }

  ReadData readData = ReadData();
//TODO: Make sure a user cannot apply to the same job twice
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
                        (apppointmentRegion == '' ||
                                apppointmentTown == '' ||
                                apppointmentHouseNum == '' ||
                                apppointmentStreet == '')
                            ? popDialog()
                            : scheduleJob();
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

  Future scheduleJob() async {
    jobCustomerAppliedIDs.clear();
    jobHandymanOffersIDs.clear();
    try {
      final document = await FirebaseFirestore.instance
          .collection('Job Application')
          .where('Customer ID', isEqualTo: loggedInUserId)
          .get();
      if (document.docs.isNotEmpty) {
        final docID = document.docs.single.id;
        jobCustomerAppliedIDs =
            document.docs.single.get('Jobs Applied.Customer');
        if (!jobCustomerAppliedIDs.contains(allJobItemList[0].jobID)) {
          jobCustomerAppliedIDs.add(allJobItemList[0].jobID);

          await FirebaseFirestore.instance
              .collection('Job Application')
              .doc(docID)
              .update({
            'Jobs Applied': {
              'Customer': jobCustomerAppliedIDs,
            }
          });
        } else {
          throw Exception();
        }
      } else {
        jobCustomerAppliedIDs.clear();
        jobCustomerAppliedIDs.add(allJobItemList[0].jobID);
        final document =
            await FirebaseFirestore.instance.collection('Job Application').add({
          'Jobs Applied': {
            'Customer': jobCustomerAppliedIDs,
            'Handyman': [],
          },
          'Jobs Upcoming': {
            'Customer': [],
            'Handyman': [],
          },
          'Jobs Completed': {
            'Customer': [],
            'Handyman': [],
          },
          'Job Offers': {
            'Customer': [],
            'Handyman': [],
          },
          'Customer ID': loggedInUserId,
        });

        final docID = document.id;

        await FirebaseFirestore.instance
            .collection('Job Application')
            .doc(docID)
            .update({'Job Application ID': docID});
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .where('Job ID', isEqualTo: allJobItemList[0].jobID)
          .get();

      final customerID = querySnapshot.docs.single.get('Customer ID');

      final docOffers = await FirebaseFirestore.instance
          .collection('Job Application')
          .where('Customer ID', isEqualTo: customerID)
          .get();

      if (docOffers.docs.isNotEmpty) {
        final docID = docOffers.docs.single.id;
        jobHandymanOffersIDs = docOffers.docs.single.get('Job Offers.Handyman');
        jobHandymanOffersIDs.add(allJobItemList[0].jobID);
        await FirebaseFirestore.instance
            .collection('Job Application')
            .doc(docID)
            .update({
          'Job Offers': {
            'Handyman': jobHandymanOffersIDs,
          }
        });
      } else {
        jobHandymanOffersIDs.add(allJobItemList[0].jobID);
        final document =
            await FirebaseFirestore.instance.collection('Job Application').add({
          'Jobs Applied': {
            'Customer': [],
            'Handyman': [],
          },
          'Jobs Upcoming': {
            'Customer': [],
            'Handyman': [],
          },
          'Jobs Completed': {
            'Customer': [],
            'Handyman': [],
          },
          'Job Offers': {
            'Customer': [],
            'Handyman': jobHandymanOffersIDs,
          },
          'Customer ID': customerID,
        });

        final docID = document.id;

        await FirebaseFirestore.instance
            .collection('Job Application')
            .doc(docID)
            .update({'Job Application ID': docID});
      }

      final jobUploadDoc = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .where('Job ID', isEqualTo: allJobItemList[0].jobID)
          .get();

      if (jobUploadDoc.docs.isNotEmpty) {
        final docID = jobUploadDoc.docs.single.id;
        List applierIDs =
            jobUploadDoc.docs.single.get('Job Details.Applier IDs');

        applierIDs.add(loggedInUserId);

        await FirebaseFirestore.instance
            .collection('Handyman Job Upload')
            .doc(docID)
            .update({
          'Job Details': {
            'Applier IDs': applierIDs,
            'People Applied': applierIDs.length,
          }
        });
      } else {
        print('Job upload update failed.');
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingSuccessfulScreen(),
        ),
      );
    } on FirebaseException catch (err) {
      print(err.toString());
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.black45,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Center(
              child: Text(
                'You have already applied for this job. You cannot apply for a particular job twice',
                style: TextStyle(height: 1.4),
                textAlign: TextAlign.center,
              ),
            )),
      );
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 23 * screenHeight),
          Center(
            child: Container(
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
          ),
          SizedBox(height: 10 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                allJobItemList[0].fullName,
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
            children: <Widget>[
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
          SizedBox(height: 25 * screenHeight),
        ],
      ),
    );
  }
}
