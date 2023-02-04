import 'package:cloud_firestore/cloud_firestore.dart';

deleteappoinment({required String id, required String mykey}) {
  if (mykey == 'admin dlt') {
    final doc = FirebaseFirestore.instance.collection('appoinments').doc(id);
    doc.delete();
  } else {}
}
