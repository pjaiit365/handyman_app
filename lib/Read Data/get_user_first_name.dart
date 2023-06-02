import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/users.dart';

class GetUserFirstName extends StatefulWidget {
  const GetUserFirstName({
    Key? key,
  }) : super(key: key);

  @override
  State<GetUserFirstName> createState() => _GetUserFirstNameState();
}

List allUsers = [];
List allProfile = [];

class _GetUserFirstNameState extends State<GetUserFirstName> {
  late final String userId;

  @override
  void initState() {
    super.initState();
    allUsers.clear();
    allProfile.clear();
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> getFirstName() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      final firstName = userData['First Name'];
      final user = UserData(
        userId: userData['User ID'],
        firstName: userData['First Name'],
        lastName: userData['Last Name'],
        number: userData['Mobile Number'],
        email: userData['Email Address'],
        role: userData['Role'],
      );
      allUsers.add(user);
      return firstName;
    } else {
      return 'User Not Found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getFirstName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'loading...',
            style: TextStyle(
                fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: TextStyle(
                fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
          );
        } else {
          final firstName = snapshot.data!;
          return Text(
            'Hi $firstName,',
            style: TextStyle(
                fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
          );
        }
      },
    );
  }
}
//
