// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../Models/category.dart';
// import '../Screens/Home/Components/body.dart';
// import '../constants.dart';
//
// class ReadData {
//
//   Future getCategoryData(String categoryName, Function() rebuildScreen) async {
//     final document = await FirebaseFirestore.instance
//         .collection('Category')
//         .where('Category Name', isEqualTo: categoryName)
//         .get();
//
//     if (document.docs.isNotEmpty) {
//       final category = document.docs.single.data();
//       final $categoryName = CategoryData(
//           categoryName: category['Category Name'],
//           servicesProvided: List<String>.from(category['Services Provided']));
//
//       //TODO: FIND A WAY TO REFRESH THE SCREEN BY ADDING SETSTATE
//       servicesProvided = $categoryName.servicesProvided;
//       rebuildScreen;
//       serviceProvHintText = servicesProvided[0];
//       servicesProvided.sort();
//     } else {
//       print('Item not found.');
//     }
//   }
// }
