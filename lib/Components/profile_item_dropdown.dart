import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';

import '../constants.dart';
import 'added_file_container.dart';

class ProfileItemDropDown extends StatefulWidget {
  final String title;
  final String hintText;
  List<String> listName;
  List selectedOptions;
  bool isWidthMax;
  bool isChargeRate;
  ProfileItemDropDown({
    Key? key,
    required this.title,
    required this.hintText,
    required this.listName,
    required this.selectedOptions,
    this.isWidthMax = true,
    this.isChargeRate = false,
  }) : super(key: key);

  @override
  State<ProfileItemDropDown> createState() => _ProfileItemDropDownState();
}

class _ProfileItemDropDownState extends State<ProfileItemDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
        DropdownButton2(
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            height: 49 * screenHeight,
            width: widget.isWidthMax ? 310 * screenWidth : 117 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15 * screenWidth, vertical: 15 * screenHeight),
          ),
          underline: Text(''),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.symmetric(
                horizontal: 10 * screenWidth, vertical: 10 * screenHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Image.asset('assets/icons/down_arrow.png'),
            iconDisabledColor: black,
            iconEnabledColor: primary,
          ),
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
                fontSize: 16, color: black, fontWeight: FontWeight.w200),
          ),
          items: widget.listName.map((String serviceCategoryList) {
            return DropdownMenuItem(
              child: Text(serviceCategoryList),
              value: serviceCategoryList,
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              widget.selectedOptions.add(dropdownvalue);
              print(widget.selectedOptions);
            });
          },
          value: widget.isChargeRate ? dropdownvalue : null,
        ),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : SizedBox(height: 16 * screenHeight),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 15 * screenWidth),
                constraints: BoxConstraints(minHeight: 49 * screenHeight),
                width: 310 * screenWidth,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: appointmentTimeColor, width: 1)),
                alignment: Alignment.centerLeft,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.selectedOptions[index],
                              style: TextStyle(
                                color: black,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.selectedOptions.removeAt(index);
                                  });
                                },
                                child: Image.asset('assets/icons/dash.png')),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: 1 * screenHeight,
                          width: 295 * screenHeight,
                          color: grey,
                        ),
                      );
                    },
                    itemCount: widget.selectedOptions.length),
              ),
      ],
    );
  }
}

class ChargePerItem extends StatefulWidget {
  const ChargePerItem({Key? key}) : super(key: key);

  @override
  State<ChargePerItem> createState() => _ChargePerItemState();
}

class _ChargePerItemState extends State<ChargePerItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            'Charge per',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
        DropdownButton2(
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            height: 49 * screenHeight,
            width: 117 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15 * screenWidth, vertical: 15 * screenHeight),
          ),
          underline: Text(''),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.symmetric(
                horizontal: 10 * screenWidth, vertical: 10 * screenHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Image.asset('assets/icons/down_arrow.png'),
            iconDisabledColor: black,
            iconEnabledColor: primary,
          ),
          isExpanded: true,
          hint: Center(
            child: Text(
              'N/A',
              style: TextStyle(
                  fontSize: 16, color: black, fontWeight: FontWeight.w200),
            ),
          ),
          items: chargePerList.map((String serviceCategoryList) {
            return DropdownMenuItem(
              child: Text(serviceCategoryList),
              value: serviceCategoryList,
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
          value: dropdownvalue,
        ),
      ],
    );
  }
}

class ProfileItemAddFile extends StatefulWidget {
  final String title;
  final String hintText;
  List<String> listName;
  List selectedOptions;
  bool isWidthMax;
  bool isChargeRate;
  bool isMomoOptions;
  ProfileItemAddFile({
    Key? key,
    required this.title,
    required this.hintText,
    required this.listName,
    required this.selectedOptions,
    this.isWidthMax = true,
    this.isChargeRate = false,
    this.isMomoOptions = false,
  }) : super(key: key);

  @override
  State<ProfileItemAddFile> createState() => _ProfileItemAddFileState();
}

class _ProfileItemAddFileState extends State<ProfileItemAddFile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
        DropdownButton2(
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            height: 49 * screenHeight,
            width: widget.isWidthMax ? 310 * screenWidth : 117 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15 * screenWidth, vertical: 15 * screenHeight),
          ),
          underline: Text(''),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.symmetric(
                horizontal: 10 * screenWidth, vertical: 10 * screenHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Image.asset('assets/icons/plus.png', color: black),
            iconDisabledColor: black,
            iconEnabledColor: primary,
          ),
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w200, color: black),
          ),
          items: widget.listName.map((String serviceCategoryList) {
            return DropdownMenuItem(
              child: Text(serviceCategoryList),
              value: serviceCategoryList,
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              widget.selectedOptions.add(dropdownvalue);
              print(widget.selectedOptions);
            });
          },
          value: widget.isChargeRate ? dropdownvalue : null,
        ),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : SizedBox(height: 16 * screenHeight),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AddedFileContainer(
                    isMomoOptions: widget.isMomoOptions,
                    index: index,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedOptions.removeAt(index);
                        });
                      },
                      child: Image.asset('assets/icons/dash.png'),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8 * screenHeight,
                  );
                },
                itemCount: widget.selectedOptions.length),
      ],
    );
  }
}

class ProfileItemAddAddress extends StatefulWidget {
  final String title;
  final String hintText;

  ProfileItemAddAddress({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);
  @override
  State<ProfileItemAddAddress> createState() => _ProfileItemAddAddressState();
}

class _ProfileItemAddAddressState extends State<ProfileItemAddAddress> {
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
    void _AddressDialogBox() {
      showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                insetPadding: EdgeInsets.all(10),
                backgroundColor: Colors.transparent,
                content: Container(
                  height: 357 * screenHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(24)),
                  padding: EdgeInsets.symmetric(
                    vertical: 22 * screenWidth,
                    horizontal: 20.5 * screenWidth,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text('Address Information',
                            style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(height: 10 * screenHeight),
                      ProfileAddressItem(
                          textEditingController: streetNameController,
                          title: 'Street name',
                          hintText: 'Enter street name...',
                          keyboardType: TextInputType.streetAddress),
                      SizedBox(height: 20 * screenHeight),
                      ProfileAddressItem(
                          textEditingController: townController,
                          title: 'Town',
                          hintText: 'Enter town name...',
                          keyboardType: TextInputType.name),
                      SizedBox(height: 20 * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RegionSelect(),
                          Spacer(),
                          ProfileAddressItem(
                              textEditingController: houseNumController,
                              isWidthMax: false,
                              width: 118,
                              title: 'House Number',
                              hintText: 'House No.',
                              keyboardType: TextInputType.name),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    addressStreetName.add(streetNameController.text);
                    addressTownName.add(townController.text);
                    addressHouseNum.add(houseNumController.text);
                    addressRegionName.add(regionValue);
                  });
                  Navigator.pop(context);
                  print(addressStreetName);
                  print(addressHouseNum);
                  print(addressTownName);
                  print(addressRegionName);
                  streetNameController.clear();
                  townController.clear();
                  houseNumController.clear();
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
                      'Save Address',
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
          );
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: _AddressDialogBox,
          child: Container(
            height: 49 * screenHeight,
            width: 310 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15 * screenWidth, vertical: 15 * screenHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: black,
                  ),
                ),
                Spacer(),
                Image.asset('assets/icons/plus.png', color: black),
                //TODO:  create and decorate alert dialog box, add address fields, save address, add details to empty variables, display number of addresses
              ],
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
      ],
    );
  }
}

class RegionSelect extends StatefulWidget {
  const RegionSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<RegionSelect> createState() => _RegionSelectState();
}

class _RegionSelectState extends State<RegionSelect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 1.5),
          child: Text(
            'Region',
            style: TextStyle(
              color: primary,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 7 * screenHeight),
        DropdownButton2(
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            height: 49 * screenHeight,
            width: 151 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: appointmentTimeColor, width: 1),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15 * screenWidth, vertical: 12 * screenHeight),
          ),
          underline: Text(''),
          dropdownStyleData: DropdownStyleData(
            width: 275 * screenWidth,
            maxHeight: 210 * screenHeight,
            padding: EdgeInsets.symmetric(
                horizontal: 10 * screenWidth, vertical: 10 * screenHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Image.asset('assets/icons/down_arrow.png'),
            iconDisabledColor: black,
            iconEnabledColor: primary,
          ),
          isExpanded: true,
          hint: Center(
            child: Text(
              'Choose one',
              style: TextStyle(
                  fontSize: 16, color: black, fontWeight: FontWeight.w200),
            ),
          ),
          items: regionsList.map((String serviceCategoryList) {
            return DropdownMenuItem(
              child: Text(
                serviceCategoryList,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              value: serviceCategoryList,
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              regionValue = dropdownvalue;
            });
          },
          value: dropdownvalue,
        ),
      ],
    );
  }
}
