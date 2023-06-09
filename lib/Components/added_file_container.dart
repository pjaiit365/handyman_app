import 'package:flutter/material.dart';

import '../constants.dart';

class AddedFileContainer extends StatefulWidget {
  bool isMomoOptions;
  final int index;
  final Widget child;
  AddedFileContainer(
      {Key? key,
      required this.index,
      required this.child,
      this.isMomoOptions = false})
      : super(key: key);

  @override
  State<AddedFileContainer> createState() => _AddedFileContainerState();
}

class _AddedFileContainerState extends State<AddedFileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49 * screenHeight,
      width: 310 * screenWidth,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.only(
        top: 14 * screenHeight,
        bottom: 14 * screenHeight,
        left: 15 * screenWidth,
        right: 13 * screenWidth,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.isMomoOptions
              ? SizedBox(height: 0, width: 0)
              : Image.asset('assets/icons/pdf.png'),
          (widget.isMomoOptions == true && widget.index == 0)
              ? Image.asset('assets/icons/mtn_momo.png')
              : SizedBox(height: 0, width: 0),
          (widget.isMomoOptions == true && widget.index == 1)
              ? Image.asset('assets/icons/vodafone_cash.png')
              : SizedBox(height: 0, width: 0),
          (widget.isMomoOptions == true && widget.index == 2)
              ? Image.asset('assets/icons/mtn_momo.png')
              : SizedBox(height: 0, width: 0),
          SizedBox(width: 14.4 * screenWidth),
          widget.isMomoOptions
              ? SizedBox(height: 0, width: 0)
              : SizedBox(
                  width: 192 * screenWidth,
                  //TODO: When Cloud Storage is implemented, grab file name and file and place it here on click
                  child: Text(
                    'NWA Plumbing Association kiln',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
          (widget.isMomoOptions == true && widget.index == 0)
              ? Text(
                  momoListOptions[widget.index],
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              : SizedBox(height: 0, width: 0),
          (widget.isMomoOptions == true && widget.index == 1)
              ? Text(
                  momoListOptions[widget.index],
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              : SizedBox(height: 0, width: 0),
          (widget.isMomoOptions == true && widget.index == 2)
              ? Text(
                  momoListOptions[widget.index],
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              : SizedBox(height: 0, width: 0),
          Spacer(),
          widget.child,
          SizedBox(width: 3.31 * screenWidth),
        ],
      ),
    );
  }
}
