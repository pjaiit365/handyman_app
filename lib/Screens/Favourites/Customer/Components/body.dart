import 'package:flutter/material.dart';

import '../../../../Components/category_item.dart';
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
                  return CategoryItem(
                    isFavouriteSelected: true,
                    index: index,
                    price: customerFavouritesPriceList[index],
                    imageLocation: customerFavouritesImageList[index],
                    name: customerFavouritesNameList[index],
                    rating: customerFavouritesRatingList[index],
                    jobType: customerFavouritesJobTypeList[index],
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
