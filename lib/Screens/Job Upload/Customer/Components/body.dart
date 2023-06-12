import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_app/Components/job_upload_location_info.dart';
import 'package:handyman_app/Components/job_upload_service_info.dart';
import 'package:handyman_app/Components/job_upload_work_cert_info.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';
import 'package:handyman_app/Components/upload_button.dart';
import 'package:handyman_app/Read%20Data/get_user_first_name.dart';
import 'package:handyman_app/Screens/Dashboard/Handymen/handymen_dashboard_screen.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/job_upload_optionals_info.dart';
import 'package:handyman_app/Components/pinned_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final chargeController = TextEditingController();

  @override
  void dispose() {
    chargeController.dispose();
  }

  //TODO: Add the upload of files, work on why charge per and expertise upload

  Future uploadJob() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .add({
        'Customer ID': loggedInUserId,
      });

      final jobID = document.id;

      addDetails(
        jobID,
        loggedInUserId,
        allUsers[0].firstName + ' ' + allUsers[0].lastName,
        //Customer's Name
        seenByHintText,
        // Who to see the job upload
        serviceCatHintText,
        // Category of job
        serviceProvHintText,
        // which service in the category to upload
        int.parse(chargeController.text.trim()),
        // Charge
        chargePHint,
        // Charge Rate
        expertHint,
        // Level of expertise
        uploadCertList,
        // Cert List
        uploadExperienceList,
        // Experience List
        ratingHintText as String,
        // Overall Rating
        int.parse(jobTotalHintText.toString()),
        //Job's completed
        uploadHouseNum,
        //house number
        uploadStreet,
        // street
        uploadTown,
        // town
        uploadRegion,
        // region
        isPortfolioTicked,
        // whether handyman should add portfolio
        isReferencesTicked, // whether handyman should add past work references
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future addDetails(
    String jobId,
    String custId,
    String userName,
    String seenBy,
    String serviceCat,
    String serviceProv,
    int charge,
    String chargeRate,
    String expertise,
    List certification,
    List experience,
    String rating,
    int jobsDone,
    String houseNum,
    String street,
    String town,
    String region,
    bool isPortfolioPresent,
    bool isReferencePresent,
  ) async {
    await FirebaseFirestore.instance
        .collection('Customer Job Upload')
        .doc(jobId)
        .update({
      'Job ID': jobId,
      'Customer ID': custId,
      'Name': userName,
      'Seen By': seenBy,
      'Service Information': {
        'Service Category': serviceCat,
        'Service Provided': serviceProv,
        'Charge': charge,
        'Charge Rate': chargeRate,
        'Expertise': expertise,
      },
      'Work Experience & Certification': {
        'Certification': certification,
        'Experience': experience,
        'Rating': rating,
        "Job's Completed": jobsDone,
      },
      'Address Information': {
        'House Number': houseNum,
        'Street': street,
        'Town': town,
        'Region': region,
      },
      'Optional': {
        'Portfolio Present': isPortfolioPresent,
        'References Present': isReferencePresent,
      }
    });
  }

  late final String jobID;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 15.0,
                    vertical: 15 * screenHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Seen by:',
                            style: TextStyle(
                              color: black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 49 * screenHeight,
                                width: 51 * screenWidth,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: appointmentTimeColor, width: 1),
                                ),
                                child: Center(
                                    child:
                                        Icon(Icons.visibility, color: primary)),
                              ),
                              SeenBySelect(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadServiceInfo(
                      chargeController: chargeController,
                    ),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadWorkCertInfo(),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadLocationInfo(),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadOptionalsInfo(),
                    SizedBox(height: 30 * screenHeight),
                  ],
                ),
              );
            },
            itemCount: 1,
          ),
        ),
        UploadButton(
          screen: uploadJob,
          icon: Icons.cloud_upload_rounded,
          buttonText: 'Upload',
          isIconPresent: true,
        )
      ],
    );
  }
}
