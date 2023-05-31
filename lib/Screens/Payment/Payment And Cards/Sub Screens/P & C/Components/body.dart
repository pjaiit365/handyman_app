import 'package:flutter/material.dart';
import 'package:handyman_app/Components/credentials_button.dart';
import 'package:handyman_app/Screens/Notifications/notification_screen.dart';
import 'package:handyman_app/Screens/Payment/Payment%20And%20Cards/Sub%20Screens/P%20&%20C/Components/history_item.dart';
import 'package:handyman_app/Screens/Settings/Components/settings_divider.dart';
import 'package:handyman_app/constants.dart';

import '../../../../../../Components/profile_item.dart';
import 'card_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardNumberController = TextEditingController();
    final expiryDateController = TextEditingController();
    final cardNameController = TextEditingController();

    void AddCard() {
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
                        child: Text('Add Card',
                            style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(height: 10 * screenHeight),
                      ProfileAddressItem(
                          textEditingController: cardNumberController,
                          title: 'Card number',
                          hintText: 'Enter card number...',
                          keyboardType: TextInputType.number),
                      SizedBox(height: 20 * screenHeight),
                      ProfileAddressItem(
                          textEditingController: expiryDateController,
                          title: 'Expiry Date',
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.datetime),
                      SizedBox(height: 20 * screenHeight),
                      ProfileAddressItem(
                          textEditingController: cardNameController,
                          title: 'Card Name',
                          hintText: 'Enter card name...',
                          keyboardType: TextInputType.datetime),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cardNumber.add(cardNumberController.text.trim());
                  cardName.add(cardNameController.text.trim());
                  cardExpiryDate.add(expiryDateController.text.trim());
                  Navigator.pop(context);
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
                      'Save Card',
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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 20.0,
          top: 20 * screenHeight,
          bottom: 20 * screenHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Center(
            //   child: CredentialsButton(
            //     screen: NotificationScreen(),
            //     buttonText: 'In-app Funds',
            //   ),
            // ),
            SizedBox(height: 27 * screenHeight),
            Padding(
              padding: EdgeInsets.only(
                left: 6 * screenWidth,
              ),
              child: Text(
                'My Cards',
                style: TextStyle(
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 17 * screenHeight),
            SizedBox(
              height: 267 * screenHeight,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CardContainer(
                            press: () {
                              cardLogo.removeAt(index);
                              cardExpiryDate.removeAt(index);
                              cardNumber.removeAt(index);
                              cardName.removeAt(index);
                            },
                            name: cardName[index],
                            number: cardNumber[index],
                            expiryDate: cardExpiryDate[index],
                            cardLogo: cardLogo[index]),
                        (cardNumber.length - 1) == index
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 30.0),
                                child: GestureDetector(
                                  onTap: AddCard,
                                  child: Container(
                                    height: 80 * screenHeight,
                                    width: 80 * screenWidth,
                                    decoration: BoxDecoration(
                                      color: sectionColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.add, color: chatBlue),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 27 * screenWidth);
                  },
                  itemCount: cardNumber.length),
            ),
            SizedBox(height: 31 * screenHeight),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 6.0),
                    child: Text(
                      'History' + '(' + '4' + ')',
                      style: TextStyle(
                        color: black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 10.0),
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15 * screenHeight),
            Center(
              child: Container(
                height: 1 * screenHeight,
                width: 350 * screenWidth,
                color: grey,
              ),
            ),
            SizedBox(height: 16 * screenHeight),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 20.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HistoryItem(
                      name: historyNameList[index],
                      jobType: historyJobTypeList[index],
                      picLocation: historyPicList[index],
                      date: historyDateList[index],
                      price: historyPriceList[index]);
                },
                separatorBuilder: (context, index) {
                  return SettingsDivider(isSettings: false);
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
