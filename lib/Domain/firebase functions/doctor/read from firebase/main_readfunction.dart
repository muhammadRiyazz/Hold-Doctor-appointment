import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_all_doctors.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_categoreis.dart';
import 'package:appoiment_docter/Domain/firebase%20functions/doctor/read%20from%20firebase/read_popular_doctor.dart';

mainfunction({required String functionkey, categoryname}) {
  if (functionkey == 'all doctors') {
    return morereaddata();
  } else if (functionkey == 'popular doctors') {
    return readdata();
  } else if (functionkey == 'category doctors') {
    return readCategorydctr(categoryname: categoryname);
  }
}
