import 'package:flutter/material.dart';

import '../constants.dart';

class SavedAddresses extends StatefulWidget {
  final int index;

  const SavedAddresses({Key? key, required this.index}) : super(key: key);

  @override
  State<SavedAddresses> createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50 * screenHeight),
      width: 310 * screenWidth,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: appointmentTimeColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 15 * screenWidth, vertical: 12 * screenHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Address ' + (widget.index + 1).toString(),
                style: TextStyle(
                  color: primary,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    addressRegionName.removeAt(widget.index);
                    addressTownName.removeAt(widget.index);
                    addressStreetName.removeAt(widget.index);
                    addressHouseNum.removeAt(widget.index);
                  });
                },
                child: Container(
                  height: 31 * screenHeight,
                  width: 30 * screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
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
            addressHouseNum[widget.index] +
                ',\n' +
                addressStreetName[widget.index] +
                ', ' +
                addressTownName[widget.index] +
                ',\n' +
                addressRegionName[widget.index] +
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
  }
}
