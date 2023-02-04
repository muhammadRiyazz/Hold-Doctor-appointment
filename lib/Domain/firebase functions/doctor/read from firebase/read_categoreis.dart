import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Stream<List<Categoreis>> readCategoreis() {

// //   Firestore.instance.collection('your_collection').snapshots().listen((snapshot) {
// //   snapshot.documents.forEach((doc) {
// //     print(doc.documentID);
// //   });
// // });

// //   final  snapshot =
// //       FirebaseFirestore.instance.collection('categoreis').doc();

//   return FirebaseFirestore.instance
//       .collection('categoreis')
//       .snapshots()
//       .map((snapshot) {
//     return snapshot.docs.map((doc) {
//       return Categoreis.fromJson(doc.data());
//     }).toList();
//   });
// }

Stream<List<OurDoctor>> readCategorydctr({required String categoryname}) {
  return FirebaseFirestore.instance
      .collection('categoreis')
      .doc(categoryname)
      .collection(categoryname)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return OurDoctor.fromJson(doc.data());
    }).toList();
  });
}
