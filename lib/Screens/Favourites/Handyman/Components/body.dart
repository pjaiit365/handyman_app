import 'package:flutter/material.dart';
import 'package:handyman_app/Components/job_category_item.dart';

import '../../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: handymanFavouritesPriceList.isNotEmpty
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        handymanFavouritesPriceList.isNotEmpty
            ? SizedBox(height: 10 * screenHeight)
            : SizedBox(),
        handymanFavouritesPriceList.isNotEmpty
            ? ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: handymanFavouritesPriceList.length,
                itemBuilder: (context, index) {
                  return JobCategoryItem(
                    jobItemId: jobDashboardID[index],
                    chargeRate: handymanDashboardChargeRate[index],
                    isFavouriteSelected: true,
                    index: index,
                    price: handymanFavouritesPriceList[index],
                    imageLocation: handymanFavouritesImageList[index],
                    name: handymanFavouritesNameList[index],
                    status: handymanFavouritesStatusList[index],
                    jobType: handymanFavouritesJobTypeList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: screenHeight * 20);
                },
              )
            : Center(
                child: Text(
                'No favourites added.',
                style: TextStyle(
                  color: semiGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              )),
      ],
    );
  }
}
