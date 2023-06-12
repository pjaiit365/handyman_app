import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:handyman_app/constants.dart';

class Storage {
  Future<void> uploadPic(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance
          .ref('$loggedInUserId/profile')
          .child('profile_pic')
          .putFile(file);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ListResult> listFiles() async {
    ListResult results =
        await FirebaseStorage.instance.ref('$loggedInUserId/images').listAll();
    return results;
  }

  Future<String> downloadUrl(String fileName) async {
    String downloadUrl = await FirebaseStorage.instance
        .ref('$loggedInUserId/profile/$fileName')
        .getDownloadURL();
    return downloadUrl;
  }

  Future<void> uploadFile(
      String filePath, String fileName, String directory) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance
          .ref('$loggedInUserId/$directory')
          .child(fileName)
          .putFile(file);
    } catch (e) {
      print(e.toString());
    }
  }

  Future listAllFiles(String directory, List fileNames) async {
    ListResult results = await FirebaseStorage.instance
        .ref('$loggedInUserId/$directory')
        .listAll();
    for (int i = 0; i < results.items.length; i++) {
      final fileName = results.items[i].name;
      print(fileName);
      fileNames.add(fileName);
    }
    return fileNames;
  }

  Future fileDownloadUrl(String downloadUrl, String directory) async {
    String downloadUrl = await FirebaseStorage.instance
        .ref('$loggedInUserId/$directory')
        .getDownloadURL();
    return downloadUrl;
  }

  Future deleteFile(String directory, String fileName) async {
    try {
      await FirebaseStorage.instance
          .ref('$loggedInUserId/$directory')
          .child(fileName)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
