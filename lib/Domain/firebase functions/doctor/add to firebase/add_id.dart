import 'package:appoiment_docter/Domain/models/id_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

addid({required String category}) {
  final iddoc =
      FirebaseFirestore.instance.collection('categoreis').doc(category);

  final datatomodal = IDmodal(id: category);
  final json = IDmodal.tojson(id: datatomodal.id);
  iddoc.set(json);
}
