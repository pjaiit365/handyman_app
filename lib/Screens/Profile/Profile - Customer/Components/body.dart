import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/constants.dart';
import '../../../../Components/profile_location_information.dart';
import '../../../../Components/profile_payment_information.dart';
import '../../../../Components/profile_personal_information.dart';
import '../../../../Models/profile.dart';
import '../../../../Read Data/get_user_first_name.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future getProfileData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('profile')
        .where('User ID', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final profileData = querySnapshot.docs.first.data();
      final user = ProfileData(
        cardNumber: profileData['Credit Card Information']['Card Number'],
        expiryDate: profileData['Credit Card Information']['Expiry Date'],
        cvv: profileData['Credit Card Information']['CVV'],
        momoType:
            (profileData['Mobile Money Type'] as List<dynamic>).cast<String>(),
        payPalAddress: profileData['PayPal'],
        houseNumber: profileData['Address Information']['House Number'] != ''
            ? List<String>.from(
                profileData['Address Information']['House Number'])
            : [],
        streetName: profileData['Address Information']['Street Name'] != ''
            ? List<String>.from(
                profileData['Address Information']['Street Name'])
            : [],
        town: profileData['Address Information']['Town'] != ''
            ? List<String>.from(profileData['Address Information']['Town'])
            : [],
        region: profileData['Address Information']['Region'] != ''
            ? List<String>.from(profileData['Address Information']['Region'])
            : [],
      );

      setState(() {
        allProfile.clear();
        allProfile.add(user);

        selectedMomoOptions = allProfile[0].momoType;
        print(selectedMomoOptions.length);
        print(selectedMomoOptions);
        cardNumberHintText = allProfile[0].cardNumber.toString();
        expiryDateHintText = allProfile[0].expiryDate;
        cvvHintText = allProfile[0].cvv.toString();
        payPalHintText = allProfile[0].payPalAddress;

        addressStreetName = allProfile[0].streetName as List<dynamic>;
        addressHouseNum = allProfile[0].houseNumber as List;
        addressRegionName = allProfile[0].region as List;
        addressTownName = allProfile[0].town as List;
      });
    } else {
      setState(() {
        allProfile.clear();
      });
      return 'User Not Found';
    }
  }

  @override
  void initState() {
    getProfileData();
    print(allProfile.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (allProfile.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15 * screenWidth, vertical: 10 * screenHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 185.75 * screenHeight,
                    width: 177 * screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile_pic.jpeg'),
                          fit: BoxFit.fill,
                        )),
                    alignment: Alignment.bottomRight,
                  ),
                  Positioned(
                    bottom: -13,
                    right: -17,
                    child: Container(
                      height: 35 * screenHeight,
                      width: 35 * screenWidth,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sectionColor,
                        border: Border.all(color: white, width: 3),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25 * screenHeight),
            ProfilePersonalInformation(),
            SizedBox(height: 25 * screenHeight),
            ProfilePaymentInformation(),
            SizedBox(height: 25 * screenHeight),
            ProfileLocationInformation(),
            SizedBox(height: 15 * screenHeight),
          ],
        ),
      ),
    );
  }
}
