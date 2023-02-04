import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> edit({
  required String id,
  required String image,
  required String name,
  required int exp,
  required int count,
  required String category,
  required String about,
}) async {
  final alldoc = FirebaseFirestore.instance.collection('all doctors').doc(id);
  final populardoctors =
      FirebaseFirestore.instance.collection('Popular doctors').doc(id);
  final categorydoc = FirebaseFirestore.instance
      .collection('categoreis')
      .doc(category)
      .collection(category)
      .doc(id);
  await categorydoc.update({
    'DotorName': name,
    'AboutDoctor': about,
    'Category': category,
    'Experiance': exp,
    'PetientsCount': count,
    'image': image,
  });
  await alldoc.update({
    'DotorName': name,
    'AboutDoctor': about,
    'Category': category,
    'Experiance': exp,
    'PetientsCount': count,
    'image': image,
  });
  await populardoctors.update({
    'DotorName': name,
    'AboutDoctor': about,
    'Category': category,
    'Experiance': exp,
    'PetientsCount': count,
    'image': image,
  });
}
