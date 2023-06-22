// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/job_upload_work_cert_info.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';
import 'package:handyman_app/Components/upload_button.dart';
import 'package:handyman_app/Screens/Dashboard/Jobs/jobs_dashboard_screen.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/job_upload_location_info.dart';
import '../../../../Components/job_upload_service_info.dart';
import '../../../../Read Data/get_user_first_name.dart';

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
    super.dispose();
  }

  late final String jobID;
  //TODO: Add the upload of files
  Future uploadJob() async {
    if (FieldsCheck()) {
      try {
        final document = await FirebaseFirestore.instance
            .collection('Handyman Job Upload')
            .add({
          'Customer ID': loggedInUserId,
        });

        final jobID = document.id;

        addDetails(
          imageUrl,
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
          jobStatus,
          // current job status of job
          referencesList, // whether handyman should add past work references
          portfolioList,
        );
//TODO: UPDATE DIALOG TO SHOW JOB UPLOADED SUCCESSFULLY SCREEN
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              insetPadding: EdgeInsets.symmetric(horizontal: 10 * screenWidth),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/success.gif')),
                  SizedBox(height: 15 * screenHeight),
                  Text(
                    'Job Uploaded Successfully!',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            );
          },
        );

        await Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => JobsDashboardScreen(),
            ),
          );
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('Some fields are empty. Try again.');
    }
  }

  Future addDetails(
    String pic,
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
    bool jobStatus,
    List reference,
    List portfolio,
  ) async {
    await FirebaseFirestore.instance
        .collection('Handyman Job Upload')
        .doc(jobId)
        .update({
      'User Pic': pic,
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
        'Reference': reference,
        'Portfolio': portfolio,
      },
      'Address Information': {
        'House Number': houseNum,
        'Street': street,
        'Town': town,
        'Region': region,
      },
    });
  }

  bool FieldsCheck() {
    if (chargeController.text.trim().isNotEmpty &&
        chargePHint != 'N/A' &&
        expertHint != 'N/A' &&
        uploadRegion != '' &&
        uploadTown != '' &&
        uploadStreet != '' &&
        uploadHouseNum != '') {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.black45,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Center(
              child: Text(
                'One or more required fields is empty. Check them again.',
                style: TextStyle(height: 1.3),
                textAlign: TextAlign.center,
              ),
            )),
      );
      return false;
    }
  }

  @override
  void initState() {
    if (chargePHint != 'N/A' || uploadTown != '') {
      seenByHintText = 'All';
      serviceCatHintText = 'Painting';
      serviceProvHintText = 'Furniture Painting';
      chargePHint = 'N/A';
      expertHint = 'N/A';
      uploadHouseNum = '';
      uploadStreet = '';
      uploadTown = '';
      uploadRegion = '';
    }
    super.initState();
  }

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
                    JobUploadServiceInfo(chargeController: chargeController),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadWorkCertInfo(isHandyManUpload: true),
                    SizedBox(height: 30 * screenHeight),
                    JobUploadLocationInfo(),
                    SizedBox(height: 30 * screenHeight),
                  ],
                ),
              );
            },
            itemCount: 1,
            shrinkWrap: true,
          ),
        ),
        UploadButton(
          screen: uploadJob,
          isIconPresent: true,
          icon: Icons.cloud_upload_rounded,
          buttonText: 'Upload',
        ),
      ],
    );
  }
}
