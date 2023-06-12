import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_app/Components/profile_item.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';

import '../constants.dart';

class JobUploadServiceInfo extends StatefulWidget {
  final TextEditingController chargeController;
  const JobUploadServiceInfo({Key? key, required this.chargeController})
      : super(key: key);

  @override
  State<JobUploadServiceInfo> createState() => _JobUploadServiceInfoState();
}

class _JobUploadServiceInfoState extends State<JobUploadServiceInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: screenWidth * 5.0, right: 10 * screenWidth),
          child: Text(
            'Service Information',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 13 * screenHeight),
        Container(
          constraints: BoxConstraints(
            minHeight: 422 * screenHeight,
          ),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ServiceCategorySelect(
                title: 'Services Category',
                dropdownList: serviceCategoryList,
                hintText: serviceCatHintText,
              ),
              SizedBox(height: 20 * screenHeight),
              ServiceCategorySelect(
                title: 'Services Provided',
                dropdownList: servicesProvidedList,
                hintText: serviceProvHintText,
              ),
              SizedBox(height: 20 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  ProfileItem(
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3)
                    ],
                    isHintText: chargeHintText == '0' ? true : false,
                    isReadOnly: jobUploadReadOnly,
                    controller: widget.chargeController,
                    title: 'Charge',
                    hintText: chargeHintText == '0'
                        ? '...'
                        : chargeHintText.toString(),
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 73,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: screenHeight * 1.0, left: 10 * screenWidth),
                    child: Container(
                      height: 47 * screenHeight,
                      width: 40 * screenWidth,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(7),
                        border:
                            Border.all(color: appointmentTimeColor, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 1.0),
                    child: ServiceCategorySelect(
                      title: 'Charge per',
                      width: 117,
                      dropdownList: chargePerList,
                      hintText: chargePHint,
                    ),
                  ),
                  SizedBox(width: 2),
                ],
              ),
              SizedBox(height: 20 * screenHeight),
              ServiceCategorySelect(
                title: 'Level of Expertise',
                dropdownList: expertiseList,
                hintText: expertHint,
              ),
              SizedBox(height: 10 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
