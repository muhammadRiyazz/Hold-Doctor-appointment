import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<OurDoctor>> morereaddata() {
  return FirebaseFirestore.instance
      .collection('all doctors')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return OurDoctor.fromJson(doc.data());
    }).toList();
  });
}

// Future<List<OurDoctor>> doctordatafuture() async {
//   final List<String> datalist = [];
//   final datadoc = FirebaseFirestore.instance.collection('');
//  final doc= datadoc.doc();






 

// }
