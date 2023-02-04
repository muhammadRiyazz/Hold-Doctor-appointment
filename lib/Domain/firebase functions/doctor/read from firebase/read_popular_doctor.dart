import 'dart:developer';

import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<PopularDoctor>> readdata() {
  return FirebaseFirestore.instance
      .collection('Popular doctors')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return PopularDoctor.fromJson(doc.data());
    }).toList();
  });
}
