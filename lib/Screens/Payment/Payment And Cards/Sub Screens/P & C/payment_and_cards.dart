import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';
import 'package:handyman_app/constants.dart';

import '../../../../Payment/Payment And Cards/Sub Screens/P & C/Components/body.dart';
import '../History Analytics/history_analytics_screen.dart';

class PaymentAndCardsScreen extends StatelessWidget {
  const PaymentAndCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        title: Text(
          'Payment & Cards',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0.0,
        backgroundColor: white,
        actions: [
          IconButton(
              padding: EdgeInsets.only(
                  right: 18 * screenWidth, bottom: 6 * screenHeight),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryAnalyticsScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.analytics_outlined,
                color: primary,
              ))
        ],
      ),
      backgroundColor: white,
      body: Body(),
    );
  }
}
