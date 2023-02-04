import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadimg({required imagefile}) async {
  if (imagefile == null) {
    return "";
  }
  final storepath = 'files/${imagefile!.name}';
  final img = File(imagefile!.path);

  final ref = FirebaseStorage.instance.ref().child(storepath);

  final task = ref.putFile(img);

  final snapshot = await task.whenComplete(() {});
  final url = await snapshot.ref.getDownloadURL();

  return url;
}
