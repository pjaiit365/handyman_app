// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/My%20Jobs/SubScreens/JobUpcoming/job_upcoming.dart';
import 'package:handyman_app/Services/read_data.dart';
import 'package:handyman_app/constants.dart';

import '../../../../../Components/appointment_job_details.dart';
import '../../../../../Components/appointment_job_status.dart';
import '../../../../../Components/job_details_and_status.dart';
import '../../../my_jobs_screen.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future cancelJobApplication(String type) async {
      // get jobsAppliedID, receiverID, applierID, jobID
      final jobsAppliedID = moreOffers[selectedJob].documentID;
      final applierID = moreOffers[selectedJob].applierID;
      final receiverID = moreOffers[selectedJob].receiverID;
      final jobID = moreOffers[selectedJob].jobID;

      // delete jobsAppliedID from applierID's Job Application -> Jobs Applied -> customer

      // delete jobsAppliedID from receiverID's Job Application -> Job Offers -> Handyman

      // delete jobsApplied from jobUpload( jobID ) -> Applier IDs
      jobHandymanUpcomingIDs.clear();
      jobHandymanAppliedIDs.clear();
      jobHandymanCompletedIDs.clear();
      jobHandymanOffersIDs.clear();
      jobCustomerUpcomingIDs.clear();
      jobCustomerAppliedIDs.clear();
      jobCustomerCompletedIDs.clear();
      jobCustomerOffersIDs.clear();

      final userJobAppDoc = await FirebaseFirestore.instance
          .collection('Job Application')
          .where('Customer ID', isEqualTo: loggedInUserId)
          .get();
      if (userJobAppDoc.docs.isNotEmpty) {
        final docID = userJobAppDoc.docs.single.id;
        jobCustomerOffersIDs =
            userJobAppDoc.docs.single.get('Job Offers.Customer');
        jobHandymanOffersIDs =
            userJobAppDoc.docs.single.get('Job Offers.Handyman');
        jobHandymanAppliedIDs =
            userJobAppDoc.docs.single.get('Jobs Applied.Handyman');
        jobCustomerAppliedIDs =
            userJobAppDoc.docs.single.get('Jobs Applied.Customer');
        jobHandymanCompletedIDs =
            userJobAppDoc.docs.single.get('Jobs Completed.Handyman');
        jobCustomerCompletedIDs =
            userJobAppDoc.docs.single.get('Jobs Completed.Customer');
        if (type == 'Customer Uploaded') {
          jobCustomerOffersIDs.remove(allJobOffers[selectedJob].jobUploadId);
        } else {
          jobHandymanOffersIDs.remove(allJobOffers[selectedJob].jobUploadId);
        }

        await FirebaseFirestore.instance
            .collection('Job Application')
            .doc(docID)
            .update({
          'Jobs Applied': {
            'Handyman': jobHandymanAppliedIDs,
            'Customer': jobCustomerAppliedIDs,
          },
          'Jobs Completed': {
            'Handyman': jobHandymanCompletedIDs,
            'Customer': jobCustomerCompletedIDs,
          },
          'Job Offers': {
            'Handyman': jobHandymanOffersIDs,
            'Customer': jobCustomerOffersIDs,
          },
          'Jobs Upcoming': {
            'Handyman': jobHandymanUpcomingIDs,
            'Customer': jobCustomerUpcomingIDs,
          },
        });
      }

      if (type == 'Customer Uploaded') {
        final uploadJob = await FirebaseFirestore.instance
            .collection('Customer Job Upload')
            .where('Job ID', isEqualTo: allJobOffers[selectedJob].jobUploadId)
            .get();
        if (uploadJob.docs.isNotEmpty) {
          final uploadJobCustID = uploadJob.docs.single.get('Customer ID');
          List applierIDs =
              uploadJob.docs.single.get('Job Details.Applier IDs');
          applierIDs.remove(loggedInUserId);
          var deadlineP = uploadJob.docs.single.get('Job Details.Deadline');
          final docID = uploadJob.docs.single.id;
          await FirebaseFirestore.instance
              .collection('Customer Job Upload')
              .doc(docID)
              .update(
            {
              'Job Details': {
                'Applier IDs': applierIDs,
                'People Applied': applierIDs.isEmpty ? 0 : applierIDs.length,
                'Deadline': deadlineP,
              }
            },
          );

          final uploadJobAppDoc = await FirebaseFirestore.instance
              .collection('Job Application')
              .where('Customer ID', isEqualTo: uploadJobCustID)
              .get();
          if (uploadJobAppDoc.docs.isNotEmpty) {
            final docID = uploadJobAppDoc.docs.single.id;
            List offersID =
                uploadJobAppDoc.docs.single.get('Job Applied.Handyman');
            offersID.remove(allJobOffers[selectedJob].jobUploadId);
            await FirebaseFirestore.instance
                .collection('Job Application')
                .doc(docID)
                .update({
              'Jobs Applied': {
                'Handyman': offersID,
              }
            });
          }
        }
      } else {
        final uploadJob = await FirebaseFirestore.instance
            .collection('Handyman Job Upload')
            .where('Job ID', isEqualTo: allJobOffers[selectedJob].jobUploadId)
            .get();
        if (uploadJob.docs.isNotEmpty) {
          final uploadJobCustID = uploadJob.docs.single.get('Customer ID');
          List applierIDs =
              uploadJob.docs.single.get('Job Details.Applier IDs');
          applierIDs.remove(loggedInUserId);
          final docID = uploadJob.docs.single.id;
          await FirebaseFirestore.instance
              .collection('Handyman Job Upload')
              .doc(docID)
              .update(
            {
              'Job Details': {
                'Applier IDs': applierIDs,
                'People Applied': applierIDs.isEmpty ? 0 : applierIDs.length,
              }
            },
          );

          final uploadJobAppDoc = await FirebaseFirestore.instance
              .collection('Job Application')
              .where('Customer ID', isEqualTo: uploadJobCustID)
              .get();
          if (uploadJobAppDoc.docs.isNotEmpty) {
            final docID = uploadJobAppDoc.docs.single.id;
            List offersID =
                uploadJobAppDoc.docs.single.get('Job Applied.Customer');
            offersID.remove(allJobOffers[selectedJob].jobUploadId);
            await FirebaseFirestore.instance
                .collection('Job Application')
                .doc(docID)
                .update({
              'Job Applied': {
                'Customer': offersID,
              }
            });
          }
        }
      }
    }

    void deleteDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Decline Job Application',
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.w600,
              ),
            )),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 30.0,
                      horizontal: 24 * screenWidth),
                  child: Text(
                    'Are you sure you want to decline this Job Application?',
                    style: TextStyle(
                      height: 1.4,
                      color: black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20 * screenHeight),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 53 * screenHeight,
                        width: 133 * screenWidth,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 12.0),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: appointmentTimeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: primary,
                      endIndent: 0,
                      indent: 0,
                      width: 10,
                      thickness: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await cancelJobApplication('Handyman Uploaded');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyJobsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 53 * screenHeight,
                        width: 133 * screenWidth,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text('Yes, Delete',
                              style: TextStyle(
                                color: red,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6 * screenHeight),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
          );
        },
      );
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: JobDetailsAndStatus(
        // function: ,
        declineFunction: deleteDialog,
        isJobPendingActive: true,
        screen: JobUpcomingScreen(),
        isJobOfferScreen: true,
        imageLocation: moreOffers[selectedJob].pic,
        name: moreOffers[selectedJob].name,
        region: moreOffers[selectedJob].region,
        chargeRate: allJobOffers[selectedJob].chargeRate,
        charge: allJobOffers[selectedJob].charge,
        street: moreOffers[selectedJob].street,
        town: moreOffers[selectedJob].town,
        houseNum: moreOffers[selectedJob].houseNum,
        jobType: allJobOffers[selectedJob].serviceProvided,
        date: moreOffers[selectedJob].date,
      ),
    );
  }
}
