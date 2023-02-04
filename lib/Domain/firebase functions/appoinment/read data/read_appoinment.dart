import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../models/appoiment_modal.dart';

Stream<List<Appoinmentmodal>> readappoinmrnt() {
  return FirebaseFirestore.instance
      .collection('appoinments')
      .snapshots()
      .map((snap) {
    return snap.docs.map((docs) {
      return Appoinmentmodal.fromJson(docs.data());
    }).toList();
  });
}
