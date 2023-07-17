import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Handyman Details/Components/body.dart';
import 'package:handyman_app/constants.dart';

class HandymanDetailsScreen extends StatefulWidget {
  const HandymanDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HandymanDetailsScreen> createState() => _HandymanDetailsScreenState();
}

List<String> handymenJobsBookmarked = [];
List<String> customerJobsBookmarked = [];

class _HandymanDetailsScreenState extends State<HandymanDetailsScreen> {
  Future isBookmarked() async {
    print(handymanDashboardID[handymanSelectedIndex]);
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Bookmark')
          .where('User ID', isEqualTo: loggedInUserId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final bookmarkId = querySnapshot.docs.single.id;
        await FirebaseFirestore.instance
            .collection('Bookmark')
            .doc(bookmarkId)
            .update({'Handyman Job IDs': handymenJobsBookmarked});
      } else {
        final document =
            await FirebaseFirestore.instance.collection('Bookmark').add({
          'User ID': loggedInUserId,
          'Customer Job IDs': customerJobsBookmarked,
          'Handyman Job IDs': handymenJobsBookmarked,
        });

        await FirebaseFirestore.instance
            .collection('Bookmark')
            .doc(document.id)
            .update({'Bookmark ID': document.id});
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isHandymanBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        elevation: 0.0,
        backgroundColor: white,
        title: Text(
          'Personnel Details',
          style: TextStyle(
              color: black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                isHandymanBookmarked = !isHandymanBookmarked;
              });
              if (isHandymanBookmarked) {
                handymenJobsBookmarked
                    .add(handymanDashboardID[handymanSelectedIndex]);
              } else {
                if (handymenJobsBookmarked
                    .contains(handymanDashboardID[handymanSelectedIndex])) {
                  handymenJobsBookmarked
                      .remove(handymanDashboardID[handymanSelectedIndex]);
                }
              }
              isBookmarked();
              // if (isHandymanBookmarked == false) {
              //   customerFavouritesImageList.removeAt(handymanSelectedIndex);
              //   customerFavouritesNameList.removeAt(handymanSelectedIndex);
              //   customerFavouritesPriceList.removeAt(handymanSelectedIndex);
              //   customerFavouritesRatingList.removeAt(handymanSelectedIndex);
              //   customerFavouritesJobTypeList.removeAt(handymanSelectedIndex);
              // }
              // if (isHandymanBookmarked == true) {
              //   customerFavouritesImageList
              //       .add(handymanDashboardImage[handymanSelectedIndex]);
              //   customerFavouritesNameList
              //       .add(handymanDashboardName[handymanSelectedIndex]);
              //   customerFavouritesPriceList
              //       .add(handymanDashboardPrice[handymanSelectedIndex]);
              //   customerFavouritesRatingList
              //       .add(handymanDashboardRating[handymanSelectedIndex]);
              //   customerFavouritesJobTypeList
              //       .add(handymanDashboardJobType[handymanSelectedIndex]);
              // }
            },
            icon: (handymenJobsBookmarked
                    .contains(handymanDashboardID[handymanSelectedIndex]))
                ? Icon(
                    Icons.bookmark,
                    color: primary,
                  )
                : Icon(
                    Icons.bookmark,
                    color: semiGrey,
                  ),
          ),
          SizedBox(width: 18 * screenWidth),
        ],
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
