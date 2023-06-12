import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_app/Components/job_upload_location_info.dart';
import 'package:handyman_app/Components/job_upload_service_info.dart';
import 'package:handyman_app/Components/job_upload_work_cert_info.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/credentials_container.dart';
import '../../../../Components/profile_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 15.0, vertical: 15 * screenHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 5.0),
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
                          border:
                              Border.all(color: appointmentTimeColor, width: 1),
                        ),
                        child: Center(
                            child: Icon(Icons.visibility, color: primary)),
                      ),
                      RegionSelect(
                          isJobUpload: true,
                          width: 290,
                          //change dropdown to who should see it
                          dropdownList: seenByList)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30 * screenHeight),
            // JobUploadServiceInfo(),
            SizedBox(height: 30 * screenHeight),
            JobUploadWorkCertInfo(isHandyManUpload: true),
            SizedBox(height: 30 * screenHeight),
            // JobUploadLocationInfo(),
          ],
        ),
      ),
    );
  }
}
