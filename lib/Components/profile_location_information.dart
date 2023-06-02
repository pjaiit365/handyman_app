import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';
import 'package:handyman_app/Components/saved_addresses.dart';

import '../constants.dart';

class ProfileLocationInformation extends StatefulWidget {
  const ProfileLocationInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileLocationInformation> createState() =>
      _ProfileLocationInformationState();
}

class _ProfileLocationInformationState
    extends State<ProfileLocationInformation> {
  final streetNameController = TextEditingController();
  final townController = TextEditingController();
  final houseNumController = TextEditingController();

  @override
  void dispose() {
    streetNameController.dispose();
    townController.dispose();
    houseNumController.dispose();
  }

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
                'Personal Information',
                style: TextStyle(
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLocationReadOnly = !isLocationReadOnly;
                  });
                },
                child: Container(
                  height: 37 * screenHeight,
                  width: 37 * screenWidth,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                        color: isLocationReadOnly ? sectionColor : primary,
                        width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      isLocationReadOnly ? Icons.edit : Icons.clear,
                      color: primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 13 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 100),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItemAddAddress(
                screen: () {
                  setState(() {
                    addressStreetName.add(streetNameController.text);
                    addressTownName.add(townController.text);
                    addressHouseNum.add(houseNumController.text);
                    addressRegionName.add(regionValue);
                  });
                  setState(() {});
                  Navigator.pop(context);
                  print(addressStreetName);
                  print(addressHouseNum);
                  print(addressTownName);
                  print(addressRegionName);
                  streetNameController.clear();
                  townController.clear();
                  houseNumController.clear();
                },
                title: 'Address',
                hintText: 'Add address here...',
                streetNameController: streetNameController,
                townController: townController,
                houseNumController: houseNumController,
              ),
              SizedBox(height: 12 * screenHeight),
              addressTownName.isEmpty
                  ? Center(
                      child: Text(
                        'No addresses added',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          constraints:
                              BoxConstraints(minHeight: 50 * screenHeight),
                          width: 310 * screenWidth,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: appointmentTimeColor, width: 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15 * screenWidth,
                              vertical: 12 * screenHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Address ' + (index + 1).toString(),
                                    style: TextStyle(
                                      color: primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addressRegionName.removeAt(index);
                                        addressTownName.removeAt(index);
                                        addressStreetName.removeAt(index);
                                        addressHouseNum.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      height: 31 * screenHeight,
                                      width: 30 * screenWidth,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: white,
                                          border: Border.all(
                                            color: appointmentTimeColor,
                                            width: 1,
                                          )),
                                      child: Image.asset(
                                        'assets/icons/dash.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                addressHouseNum[index] +
                                    ',\n' +
                                    addressStreetName[index] +
                                    ', ' +
                                    addressTownName[index] +
                                    ',\n' +
                                    addressRegionName[index] +
                                    ', Ghana',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10 * screenHeight),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12 * screenHeight);
                      },
                      itemCount: addressTownName.length),
              isLocationReadOnly
                  ? SizedBox()
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 53 * screenHeight,
                            width: 310 * screenWidth,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 5 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
