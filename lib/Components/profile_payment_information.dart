import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';
import 'package:handyman_app/Components/profile_item_dropdown.dart';

import '../constants.dart';

class ProfilePaymentInformation extends StatefulWidget {
  const ProfilePaymentInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePaymentInformation> createState() =>
      _ProfilePaymentInformationState();
}

class _ProfilePaymentInformationState extends State<ProfilePaymentInformation> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _payPalController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _payPalController.dispose();
    super.dispose();
  }

  Future updatePaymentInfo() async {
    userId = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      isPaymentInfoReadOnly = true;
    });

    // update current user's firebase record with payment information
    updateDetails();

    // selectedMomoOptions
  }

  late final String userId;

  Future updateDetails() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;

      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        'Mobile Money': selectedMomoOptions,
        'Credit Card Information': {
          'Card Number': selectedMomoOptions,
          'Expiry Date': selectedMomoOptions,
          'CVV': selectedMomoOptions,
        },
        'PayPal': selectedMomoOptions,
      });
    } else {
      return 'User Not Found';
    }
  }

  bool CheckFields() {
    if (selectedMomoOptions.isNotEmpty &&
        _cardNumberController != null &&
        _cvvController != null &&
        _expiryDateController != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Payment Information',
                style: TextStyle(
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPaymentInfoReadOnly = !isPaymentInfoReadOnly;
                  });
                },
                child: Container(
                  height: 37 * screenHeight,
                  width: 37 * screenWidth,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                        color: isPaymentInfoReadOnly ? sectionColor : primary,
                        width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      isPaymentInfoReadOnly ? Icons.edit : Icons.clear,
                      color: primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 13 * screenHeight),
        Container(
          constraints: BoxConstraints(minHeight: 382),
          width: 359 * screenWidth,
          decoration: BoxDecoration(
              color: sectionColor, borderRadius: BorderRadius.circular(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 23 * screenWidth, vertical: 22 * screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileItemAddFile(
                isReadOnly: isPaymentInfoReadOnly,
                isMomoOptions: true,
                selectedOptions: selectedMomoOptions,
                title: 'Mobile Money',
                hintText: 'Select all that apply...',
                listName: momoListOptions,
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(
                maxLength: 16,
                isReadOnly: isPaymentInfoReadOnly,
                controller: _cardNumberController,
                imageAssetLocation: 'assets/icons/credit_card.png',
                isCreditCard: true,
                title: 'Credit Card',
                hintText: 'Add credit card number here...',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 11 * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(
                    maxLength: 4,
                    isReadOnly: isPaymentInfoReadOnly,
                    controller: _expiryDateController,
                    isTitlePresent: false,
                    title: '',
                    hintText: 'MM/YY',
                    keyboardType: TextInputType.datetime,
                    isWidthMax: false,
                    width: 174,
                  ),
                  SizedBox(width: 20 * screenWidth),
                  ProfileItem(
                    isReadOnly: isPaymentInfoReadOnly,
                    controller: _cvvController,
                    isInputObscured: true,
                    isTitlePresent: false,
                    title: '',
                    hintText: 'CVV/CVC',
                    keyboardType: TextInputType.number,
                    isWidthMax: false,
                    width: 116,
                  ),
                ],
              ),
              SizedBox(height: 20 * screenHeight),
              ProfileItem(
                isReadOnly: isPaymentInfoReadOnly,
                controller: _payPalController,
                title: 'PayPal',
                hintText: 'Enter PayPal address...',
                keyboardType: TextInputType.emailAddress,
                isCreditCard: true,
                imageAssetLocation: 'assets/icons/pay_pal.png',
              ),
              SizedBox(height: 10 * screenHeight),
              isPaymentInfoReadOnly
                  ? SizedBox()
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 20.0),
                        child: GestureDetector(
                          onTap: updatePaymentInfo,
                          child: Container(
                            height: 53 * screenHeight,
                            width: 310 * screenWidth,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 5 * screenHeight),
            ],
          ),
        ),
      ],
    );
  }
}
