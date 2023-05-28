import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/Screens/Handyman Details/Components/body.dart';
import 'package:handyman_app/constants.dart';

class HandymanDetailsScreen extends StatefulWidget {
  const HandymanDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HandymanDetailsScreen> createState() => _HandymanDetailsScreenState();
}

class _HandymanDetailsScreenState extends State<HandymanDetailsScreen> {
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
              if (isHandymanBookmarked == false) {
                customerFavouritesImageList.removeAt(handymanSelectedIndex);
                customerFavouritesNameList.removeAt(handymanSelectedIndex);
                customerFavouritesPriceList.removeAt(handymanSelectedIndex);
                customerFavouritesRatingList.removeAt(handymanSelectedIndex);
                customerFavouritesJobTypeList.removeAt(handymanSelectedIndex);
              }
              if (isHandymanBookmarked == true) {
                customerFavouritesImageList
                    .add(handymanDashboardImage[handymanSelectedIndex]);
                customerFavouritesNameList
                    .add(handymanDashboardName[handymanSelectedIndex]);
                customerFavouritesPriceList
                    .add(handymanDashboardPrice[handymanSelectedIndex]);
                customerFavouritesRatingList
                    .add(handymanDashboardRating[handymanSelectedIndex]);
                customerFavouritesJobTypeList
                    .add(handymanDashboardJobType[handymanSelectedIndex]);
              }
            },
            icon: isHandymanBookmarked
                ? Icon(
                    Icons.bookmark,
                    color: chatBlue,
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
