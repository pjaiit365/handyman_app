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

class _GetUserFirstNameState extends State<GetUserFirstName> {
  late final String userId;

  @override
  void initState() {
    super.initState();
    allUsers.clear();
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
//   if (snapshot.connectionState == ConnectionState.done) {
//     Map<String, dynamic> data =
//         snapshot.data!.data() as Map<String, dynamic>;
//
//     // for (int i = 0; i < docIds.length; i++) {
//     //   final usersVar = UserData(
//     //     user_id: data['User ID'],
//     //     first_name: data['First Name'],
//     //     last_name: data['Last Name'],
//     //     number: data['Mobile Number'],
//     //     email: data['Email Address'],
//     //     role: data['Role'],
//     //   );
//     //   allUsers.add(usersVar);
//     //   print(allUsers);
//
//     //   for (int i = 0; i < allUsers.length; i++) {
//     //     if (userId == allUsers[i].user_id) {
//     //       userName = allUsers[i].first_name;
//     //       print(userName);
//     //     }
//     //     print(userName);
//     //   }
//     // }
//     // print(docIds);
//     // print(allUsers[0].first_name);
//
//     // for (int i = 0; i < docIds.length; i++) {
//     //   if (users.doc(docIds[i]).get() == userId) {
//     //     print(docIds[i]);
//     //   }
//     // }
//
//     // for (var eachUser in) {
//     //   final usersVar = UserData(
//     //       user_id: data['User ID'],
//     //       first_name: data['First Name'],
//     //       last_name: data['Last Name'],
//     //       number: data['Mobile Number'],
//     //       email: data['Email Address'],
//     //       role: data['Role']);
//     // }
//
//     // try {
//     //   if (response.statusCode == 200) {
//     //     var jsonData = jsonDecode(response.body);
//     //     for (var eachPlayer in jsonData['data']) {
//     //       final players = PlayerData(
//     //         team_id: eachPlayer['team']['id'],
//     //         player_id: eachPlayer['id'],
//     //         firstName: eachPlayer['first_name'],
//     //         lastName: eachPlayer['last_name'],
//     //         position: eachPlayer['position'],
//     //       );
//     //
//     //       allPlayer.add(players);
//     //     }
//     //
//     //     // print(allPlayer.length);
//     //
//     //     for (int i = 0; i < allPlayer.length; i++) {
//     //       if (allPlayer[i].team_id == (chosenTeamIndex + 1)) {
//     //         player.add(allPlayer[i]);
//     //         print('${i + 1} players in list');
//     //         print(player[i].team_id);
//     //       }
//     //     }
//     //     print(player.length);
//     //   } else {
//     //     Center(
//     //       child: Text('API Error. API system not responding, try again later.'),
//     //     );
//     //   }
//     // } on Error catch (e) {
//     //   print('Error: $e');
//     // }
//
//     return Text(
//       'Hi ${data['First Name']},',
//       style: TextStyle(
//           fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
//     );
//   }
//   return Text(
//     'loading...',
//     style: TextStyle(
//         fontFamily: 'Habibi', fontSize: 30, color: Colors.black),
//   );
