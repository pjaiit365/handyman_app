import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Payment/BankPayment/bank_payment.dart';
import 'package:handyman_app/Screens/Payment/CreditCardPayment/credit_card_payment.dart';
import 'package:handyman_app/Screens/Payment/MobileMoneyPayment/mobile_money_payment.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Components/payment_option_item.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 50.0, horizontal: 27 * screenWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              'Choose your payment method',
              style: TextStyle(
                color: black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 74 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentOptionItem(
                logoLocation: 'assets/images/mobile_money.png',
                optionTitle: 'Mobile Money',
                press: MobileMoneyPayment(),
              ),
              SizedBox(width: 41 * screenWidth),
              PaymentOptionItem(
                logoLocation: 'assets/images/credit_card.png',
                optionTitle: 'Credit/Debit \nCard',
                press: CreditCardPayment(),
              )
            ],
          ),
          SizedBox(height: 56 * screenHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 175 * screenHeight,
                  width: 146 * screenWidth,
                  decoration: BoxDecoration(
                    color: sectionColor,
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.25),
                        spreadRadius: 10.0,
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 46.0,
                            bottom: 15 * screenHeight),
                        child: Image.asset(
                          'assets/images/paypal.png',
                          width: 100 * screenWidth,
                          height: 50 * screenHeight,
                        ),
                      ),
                      Text(
                        'PayPal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 41 * screenWidth),
              PaymentOptionItem(
                logoLocation: 'assets/images/bank_transfer.png',
                optionTitle: 'Bank Transfer',
                press: BankPayment(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
