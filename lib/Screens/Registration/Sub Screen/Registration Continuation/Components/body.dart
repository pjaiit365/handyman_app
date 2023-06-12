import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Home/home_screen.dart';
import 'package:handyman_app/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future register() async {
    //creating a collection in firestore database called 'Profile'
    final querySnapshot = await FirebaseFirestore.instance
        .collection('profile')
        .where('User ID', isEqualTo: loggedInUserId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;
      await FirebaseFirestore.instance.collection('profile').doc(docId).update({
        'Service Information': {
          'Service Category': '',
          'Services Provided': '',
          'Charge': 0,
          'Charge Rate': 'N/A',
          'Level of Expertise': 'N/A',
        },
        'Work Experience & Certification': {
          'Certification': '',
          'Experience': '',
          'Rating': 0.0,
          'Number of Jobs': 0,
        },
      });
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          insetPadding: EdgeInsets.symmetric(horizontal: 150 * screenWidth),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              (Platform.isIOS)
                  ? const CupertinoActivityIndicator(
                      radius: 20,
                      color: Color(0xff32B5BD),
                    )
                  : const CircularProgressIndicator(
                      color: Color(0xff32B5BD),
                    ),
            ],
          ),
        );
      },
    );

    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: GestureDetector(
            onTap: register,
            child: Container(
              height: 65 * screenHeight,
              width: 250 * screenWidth,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
