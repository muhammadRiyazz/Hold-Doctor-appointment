import 'package:cloud_firestore/cloud_firestore.dart';

deletedata({required String id, required String categoryname}) {
  final alldata = FirebaseFirestore.instance.collection('all doctors').doc(id);
  alldata.delete();
  final categorydata = FirebaseFirestore.instance
      .collection('categoreis')
      .doc(categoryname)
      .collection(categoryname)
      .doc(id);
  categorydata.delete();
  final populardoctor =
      FirebaseFirestore.instance.collection('Popular doctors').doc(id);
  populardoctor.delete();
}
