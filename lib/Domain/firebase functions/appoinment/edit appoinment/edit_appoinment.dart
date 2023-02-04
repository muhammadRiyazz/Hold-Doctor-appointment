import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

reschedul(
    {required String date, required TimeOfDay time, required String id}) async {
  final doc = FirebaseFirestore.instance.collection('appoinments').doc(id);

  final String filter = '${time.hour}:${time.minute}';
  doc.update({
    'time': filter,
    'date': date,
  });
}
