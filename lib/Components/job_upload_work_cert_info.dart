import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_app/Components/profile_item.dart';

import '../constants.dart';
import 'add_file_item.dart';

class JobUploadWorkCertInfo extends StatefulWidget {
  bool isHandyManUpload;
  JobUploadWorkCertInfo({
    Key? key,
    this.isHandyManUpload = false,
  }) : super(key: key);

  @override
  State<JobUploadWorkCertInfo> createState() => _JobUploadWorkCertInfoState();
}

class _JobUploadWorkCertInfoState extends State<JobUploadWorkCertInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.isHandyManUpload
                    ? 'Work Experience & Certification'
                    : 'Work Details & Rating',
                style: TextStyle(
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 13 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 120),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.isHandyManUpload
                  ? AddFileItem(
                      directory: 'Certification',
                      isReadOnly: jobUploadReadOnly,
                      selectedOptions: uploadCertList,
                      screen: () {
                        setState(() {});
                      },
                      title: 'Certification',
                      hintText: 'Add all certifications here...',
                    )
                  : AddFileItem(
                      directory: 'Portfolio',
                      isReadOnly: jobUploadReadOnly,
                      selectedOptions: uploadPortfolioList,
                      screen: () {
                        setState(() {});
                      },
                      title: 'Portfolio',
                      hintText: 'Add all portfolio here...',
                    ),
              widget.isHandyManUpload
                  ? SizedBox(height: 20 * screenHeight)
                  : SizedBox(),
              widget.isHandyManUpload
                  ? AddFileItem(
                      directory: 'Experience',
                      isReadOnly: jobUploadReadOnly,
                      selectedOptions: uploadExperienceList,
                      title: 'Experience',
                      hintText: 'Add any previous work here...',
                      screen: () {},
                    )
                  : SizedBox(),
              SizedBox(height: 20 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4)
                    ],
                    isReadOnly: true,
                    isOverallRating: true,
                    title: 'Rating',
                    hintText: '4.7',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 140,
                  ),
                  SizedBox(width: 20 * screenWidth),
                  widget.isHandyManUpload
                      ? ProfileItem(
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5)
                          ],
                          isHintText: false,
                          title: 'Number of Jobs',
                          hintText: jobTotalHintText.toString(),
                          keyboardType: TextInputType.number,
                          isWidthMax: false,
                          width: 139,
                        )
                      : SizedBox(),
                ],
              ),
              widget.isHandyManUpload
                  ? SizedBox(height: 20 * screenHeight)
                  : SizedBox(),
              widget.isHandyManUpload
                  ? AddFileItem(
                      directory: 'Certification',
                      isReadOnly: jobUploadReadOnly,
                      selectedOptions: uploadReferenceList,
                      screen: () {
                        setState(() {});
                      },
                      title: 'References',
                      hintText: 'Add any references here...',
                    )
                  : SizedBox(),
              widget.isHandyManUpload
                  ? SizedBox(height: 20 * screenHeight)
                  : SizedBox(),
              widget.isHandyManUpload
                  ? AddFileItem(
                      directory: 'Portfolio',
                      isReadOnly: jobUploadReadOnly,
                      selectedOptions: uploadPortfolioList,
                      screen: () {
                        setState(() {});
                      },
                      title: 'Portfolio',
                      hintText: 'Add portfolio here...',
                    )
                  : SizedBox(),
              SizedBox(height: 10 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
