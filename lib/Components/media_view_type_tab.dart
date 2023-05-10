import 'package:flutter/material.dart';

import '../constants.dart';

class MediaViewTypeTab extends StatefulWidget {
  const MediaViewTypeTab({
    Key? key,
  }) : super(key: key);

  @override
  State<MediaViewTypeTab> createState() => _MediaViewTypeTabState();
}

class _MediaViewTypeTabState extends State<MediaViewTypeTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 54 * screenHeight,
        width: 344 * screenWidth,
        decoration: BoxDecoration(
          color: sectionColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 42 * screenWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  isGridViewSelected = !isGridViewSelected;

                  if (isGridViewSelected == true) isSingleViewSelected = false;
                  if (isSingleViewSelected == false) isGridViewSelected = true;
                });
              },
              child: Text(
                'Grid View',
                style: isGridViewSelected
                    ? TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: primary)
                    : TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: black),
              ),
            ),
            isGridViewSelected
                ? SizedBox(width: 49.5 * screenWidth)
                : SizedBox(width: 50.5 * screenWidth),
            Center(
              child: Container(
                height: 54 * screenHeight,
                width: 6 * screenWidth,
                color: white,
              ),
            ),
            SizedBox(width: 30.5 * screenWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSingleViewSelected = !isSingleViewSelected;

                  if (isSingleViewSelected == true) isGridViewSelected = false;
                  if (isGridViewSelected == false) isSingleViewSelected = true;
                });
              },
              child: Text(
                'Single View',
                style: isSingleViewSelected
                    ? TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primary)
                    : TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
