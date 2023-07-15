// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handyman_app/Models/customer_job_upload_item_data.dart';
import 'package:handyman_app/Models/job_item_data.dart';
import 'package:handyman_app/Screens/Dashboard/Handymen/handymen_dashboard_screen.dart';
import 'package:handyman_app/Screens/Dashboard/Jobs/jobs_dashboard_screen.dart';
import 'package:handyman_app/Screens/Job%20Upload/Sub%20Screen/Customer/customer_job_upload_list.dart';
import 'package:handyman_app/Screens/Job%20Upload/Sub%20Screen/Handyman/Components/body.dart';

import '../Components/job_upload_optionals_info.dart';
import '../Models/handyman_job_upload_item_data.dart';
import '../Screens/Job Upload/Sub Screen/Customer/Components/body.dart';
import '../constants.dart';

List<dynamic> allJobItemList = [];
List<dynamic> jobUploadItemData = [];
late CustomerJobUploadItemData jobUploadData;
late HandymanJobUploadItemData handymanJobUploadData;

class ReadData {
  Future getHandymanJobItemData(String jobId) async {
    allJobItemList.clear();

    try {
      final document = await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .where('Job ID', isEqualTo: jobId)
          .get();

      if (document.docs.isNotEmpty) {
        currentJobClickedUserId = document.docs.single.get('Customer ID');

        final documentData = document.docs.single.data();
        final jobItemData = JobItemData(
          pic: documentData['User Pic'] == '' ? '' : documentData['User Pic'],
          deadline: documentData['Job Details']['Deadline'],
          peopleApplied: documentData['Job Details']['People Applied'],
          jobID: documentData['Job ID'],
          seenBy: documentData['Seen By'],
          chargeRate: documentData['Service Information']['Charge Rate'] ==
                  'Hour'
              ? 'Hr'
              : documentData['Service Information']['Charge Rate'] == '6 hours'
                  ? '6 Hrs'
                  : documentData['Service Information']['Charge Rate'] ==
                          '12 hours'
                      ? '12 Hrs'
                      : documentData['Service Information']['Charge Rate'],
          jobCategory: documentData['Service Information']['Service Category'],
          fullName: documentData['Name'],
          jobService: documentData['Service Information']['Service Provided'],
          charge: documentData['Service Information']['Charge'],
          jobStatus: documentData['Job Details']['Job Status'],
          isPortfolioPresent: documentData['Optional']['Portfolio Present'],
          isReferencesPresent: documentData['Optional']['References Present'],
        );
        allJobItemList.add(jobItemData);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCustomerJobItemData(String jobId) async {
    allJobItemList.clear();

    try {
      final document = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .where('Job ID', isEqualTo: jobId)
          .get();

      if (document.docs.isNotEmpty) {
        currentJobClickedUserId = document.docs.single.get('Customer ID');

        final documentData = document.docs.single.data();
        final jobItemData = JobItemData(
          rating: documentData['Work Experience & Certification']['Rating'],
          pic: documentData['User Pic'],
          jobID: documentData['Job ID'],
          seenBy: documentData['Seen By'],
          chargeRate: documentData['Service Information']['Charge Rate'] ==
                  'Hour'
              ? 'Hr'
              : documentData['Service Information']['Charge Rate'] == '6 Hours'
                  ? '6 Hrs'
                  : documentData['Service Information']['Charge Rate'] ==
                          '12 Hours'
                      ? '12 Hrs'
                      : documentData['Service Information']['Charge Rate'],
          jobCategory: documentData['Service Information']['Service Category'],
          fullName: documentData['Name'],
          jobService: documentData['Service Information']['Service Provided'],
          charge: documentData['Service Information']['Charge'],
        );
        allJobItemList.add(jobItemData);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCustomerJobUploadItemData(
      String jobID, TextEditingController charge) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .doc(jobID)
          .get();

      if (querySnapshot.exists) {
        final documentData = querySnapshot.data()!;

        final expiry = documentData['Job Details']['Deadline'];
        final day = expiry[0].toString() + expiry[1].toString();
        final month = expiry[3].toString() + expiry[4].toString();
        final year = expiry[6].toString() +
            expiry[7].toString() +
            expiry[8].toString() +
            expiry[9].toString();
        jobUploadData = CustomerJobUploadItemData(
            jobUploadId: documentData['Job ID'],
            serviceProvided: documentData['Service Information']
                ['Service Provided'],
            seenBy: documentData['Seen By'],
            deadlineDay: day,
            deadlineMonth: month,
            deadlineYear: year,
            serviceCat: documentData['Service Information']['Service Category'],
            charge: documentData['Service Information']['Charge'].toString(),
            chargeRate: documentData['Service Information']['Charge Rate'],
            rating: documentData['Work Detail & Rating']['Rating'],
            houseNum: documentData['Address Information']['House Number'],
            region: documentData['Address Information']['Region'],
            town: documentData['Address Information']['Town'],
            street: documentData['Address Information']['Street'],
            portfolioOption: documentData['Optional']['Portfolio Present'],
            referenceOption: documentData['Optional']['References Present'],
            expertise: documentData['Service Information']['Expertise'],
            portfolio: documentData['Work Detail & Rating']['Portfolio']);

        seenByHintText = jobUploadData.seenBy;
        deadlineDay = jobUploadData.deadlineDay;
        deadlineMonth = jobUploadData.deadlineMonth;
        deadlineYear = jobUploadData.deadlineYear;
        serviceCatHintText = jobUploadData.serviceCat;
        serviceProvHintText = jobUploadData.serviceProvided;
        charge.text = jobUploadData.charge.toString();
        chargePHint = jobUploadData.chargeRate;
        expertHint = jobUploadData.expertise ?? 'N/A';
        uploadPortfolioList = jobUploadData.portfolio ?? [];
        ratingHintText = jobUploadData.rating;
        uploadTown = jobUploadData.town;
        uploadStreet = jobUploadData.street;
        uploadRegion = jobUploadData.region;
        uploadHouseNum = jobUploadData.houseNum;
        isReferencesTicked = jobUploadData.referenceOption;
        isPortfolioTicked = jobUploadData.portfolioOption;

        return jobUploadData;
      } else {
        throw ('Document does not exist');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getHandymanJobUploadItemData(
      String jobID, TextEditingController charge) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .doc(jobID)
          .get();

      if (querySnapshot.exists) {
        final documentData = querySnapshot.data()!;

        //TODO: MODIFY SUCH THAT IT DISPLAYS HOW MANY DAYS MORE TILL JOB BECOMES INVALID
        // final expiry = documentData['Job Details']['Deadline'];
        // final day = expiry[0].toString() + expiry[1].toString();
        // final month = expiry[3].toString() + expiry[4].toString();
        // final year = expiry[6].toString() +
        //     expiry[7].toString() +
        //     expiry[8].toString() +
        //     expiry[9].toString();
        handymanJobUploadData = HandymanJobUploadItemData(
          jobUploadId: documentData['Job ID'],
          serviceProvided: documentData['Service Information']
              ['Service Provided'],
          seenBy: documentData['Seen By'],
          // deadlineDay: day,
          // deadlineMonth: month,
          // deadlineYear: year,
          serviceCat: documentData['Service Information']['Service Category'],
          charge: documentData['Service Information']['Charge'].toString(),
          chargeRate: documentData['Service Information']['Charge Rate'],
          rating: documentData['Work Experience & Certification']['Rating'],
          houseNum: documentData['Address Information']['House Number'],
          region: documentData['Address Information']['Region'],
          town: documentData['Address Information']['Town'],
          street: documentData['Address Information']['Street'],

          expertise: documentData['Service Information']['Expertise'],
          portfolio: documentData['Work Experience & Certification']
              ['Portfolio'],
          references: documentData['Work Experience & Certification']
              ['References'],
          experience: documentData['Work Experience & Certification']
              ['Experience'],
          certification: documentData['Work Experience & Certification']
              ['Certification'],
        );

        seenByHintText = handymanJobUploadData.seenBy;
        // deadlineDay = handymanJobUploadData.deadlineDay;
        // deadlineMonth = handymanJobUploadData.deadlineMonth;
        // deadlineYear = handymanJobUploadData.deadlineYear;
        serviceCatHintText = handymanJobUploadData.serviceCat;
        serviceProvHintText = handymanJobUploadData.serviceProvided;
        charge.text = handymanJobUploadData.charge.toString();
        chargePHint = handymanJobUploadData.chargeRate;
        expertHint = handymanJobUploadData.expertise ?? 'N/A';
        uploadPortfolioList = handymanJobUploadData.portfolio ?? [];
        uploadReferenceList = handymanJobUploadData.references ?? [];
        uploadCertList = handymanJobUploadData.certification ?? [];
        uploadExperienceList = handymanJobUploadData.experience ?? [];
        ratingHintText = handymanJobUploadData.rating;
        uploadTown = handymanJobUploadData.town;
        uploadStreet = handymanJobUploadData.street;
        uploadRegion = handymanJobUploadData.region;
        uploadHouseNum = handymanJobUploadData.houseNum;

        return handymanJobUploadData;
      } else {
        throw ('Document does not exist');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteJobUpload(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .doc(allHandymanJobsUpload[selectedJobUploadIndex].jobUploadId)
          .delete()
          .catchError((err) {
        print(err.toString());
      });

      //TODO:FIX THE DELETION OF FILES ANF FOLDERS FROM FIREBASE STORAGE
      await FirebaseStorage.instance
          .ref(
              '$loggedInUserId/Customer Job Upload/${allHandymanJobsUpload[selectedJobUploadIndex].jobUploadId}')
          .listAll()
          .then((document) {
        FirebaseStorage.instance.ref(document.items.first.fullPath).delete();
      }).catchError((err) {
        print(err.toString());
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.symmetric(horizontal: 10 * screenWidth),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(image: AssetImage('assets/images/success.gif')),
                SizedBox(height: 15 * screenHeight),
                Text(
                  'Job Upload Deleted Successfully!',
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
            builder: (context) => HandymanDashboardScreen(),
          ),
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future handymanDeleteJobUpload(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .doc(allHandymanJobsUpload[selectedJobUploadIndex].jobUploadId)
          .delete()
          .catchError((err) {
        print(err.toString());
      });

      //TODO:FIX THE DELETION OF FILES ANF FOLDERS FROM FIREBASE STORAGE
      await FirebaseStorage.instance
          .ref(
              '$loggedInUserId/Handyman Job Upload/${allHandymanJobsUpload[selectedJobUploadIndex].jobUploadId}')
          .listAll()
          .then((document) {
        FirebaseStorage.instance.ref(document.items.first.fullPath).delete();
      }).catchError((err) {
        print(err.toString());
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.symmetric(horizontal: 10 * screenWidth),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(image: AssetImage('assets/images/success.gif')),
                SizedBox(height: 15 * screenHeight),
                Text(
                  'Job Upload Deleted Successfully!',
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
  }
}
