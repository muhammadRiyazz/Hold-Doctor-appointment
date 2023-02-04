import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Future addcategoreis({required String categoryname}) async {
//   final categoreis =
//       FirebaseFirestore.instance.collection('categoreis').doc(categoryname);
//   final categorydata = Categoreis(
//     categoryname: categoryname,
//   );
//   final json = Categoreis.toJson(categoryname: categorydata.categoryname);

//   await categoreis.set(json);
// }

Future doctorstocategory({
  required String doctorname,
  required String aboutdoctor,
  required String categoryname,
  required int exp,
  required String imgurl,
  required int count,
  required String id,
}) async {
  final categoreis = FirebaseFirestore.instance
      .collection('categoreis')
      .doc(categoryname)
      .collection(categoryname)
      .doc(id);
  final data = OurDoctor(
    aboutDoctor: aboutdoctor,
    category: categoryname,
    doctorName: doctorname,
    experiance: exp,
    id: id,
    image: imgurl,
    petientsCount: count,
  );
  final json = OurDoctor.toJson(
      aboutDoctor: data.aboutDoctor,
      category: data.category,
      doctorName: data.doctorName,
      experiance: data.experiance,
      id: data.id,
      petientsCount: data.petientsCount,
      image: data.image);

  await categoreis.set(json);
}
