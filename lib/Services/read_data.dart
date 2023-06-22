import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handyman_app/Models/job_item_data.dart';

List<dynamic> allJobItemList = [];

class ReadData {
  Future getHandymanJobItemData(String jobId) async {
    allJobItemList.clear();
    try {
      final document = await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .where('Job ID', isEqualTo: jobId)
          .get();

      if (document.docs.isNotEmpty) {
        final documentData = document.docs.single.data();
        final jobItemData = JobItemData(
          pic: documentData['User Pic'],
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
        );
        allJobItemList.add(jobItemData);

        print(allJobItemList[0].jobID);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCustomerJobItemData(String jobId) async {
    print(jobId);
    allJobItemList.clear();
    try {
      final document = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .where('Job ID', isEqualTo: jobId)
          .get();

      if (document.docs.isNotEmpty) {
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
        print(allJobItemList[0].jobID);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
