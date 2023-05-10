import 'package:flutter/material.dart';

import '../constants.dart';

class SectionTabs extends StatefulWidget {
  const SectionTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<SectionTabs> createState() => _SectionTabsState();
}

class _SectionTabsState extends State<SectionTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          highlightColor: tabLight,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              aboutSelected = !aboutSelected;
              if (aboutSelected == true) {
                reviewsSelected = false;
                portfolioSelected = false;
              }
              if (reviewsSelected == false && portfolioSelected == false)
                aboutSelected = true;
            });
          },
          child: Container(
            height: 35 * screenHeight,
            width: 90 * screenWidth,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'About',
                style: aboutSelected == true
                    ? TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )
                    : TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
              ),
            ),
          ),
        ),
        Container(
          height: screenHeight * 25,
          width: screenWidth * 2,
          color: grey,
        ),
        InkWell(
          highlightColor: tabLight,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              reviewsSelected = !reviewsSelected;
              if (reviewsSelected == true) {
                aboutSelected = false;
                portfolioSelected = false;
              }
              if (aboutSelected == false && portfolioSelected == false)
                reviewsSelected = true;
            });
          },
          child: Container(
            height: 35 * screenHeight,
            width: 90 * screenWidth,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Reviews',
                style: reviewsSelected == true
                    ? TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )
                    : TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
              ),
            ),
          ),
        ),
        Container(
          height: screenHeight * 25,
          width: screenWidth * 2,
          color: grey,
        ),
        InkWell(
          highlightColor: tabLight,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              portfolioSelected = !portfolioSelected;
              if (portfolioSelected == true) {
                reviewsSelected = false;
                aboutSelected = false;
              }
              if (reviewsSelected == false && aboutSelected == false)
                portfolioSelected = true;
            });
          },
          child: Container(
            height: 35 * screenHeight,
            width: 90 * screenWidth,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Portfolio',
                style: portfolioSelected == true
                    ? TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )
                    : TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
