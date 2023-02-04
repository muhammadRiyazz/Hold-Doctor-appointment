import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20time%20and%20date/screen_time_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_categoreis.dart';
import '../screen aboutdocter/screen_about_docter.dart';

class ScreenCategoreis extends StatelessWidget {
  const ScreenCategoreis({super.key, required this.categoryname});
  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                categoryname,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: radius10,
                    color: mgreya,
                  ),
                  height: 40,
                  width: 40,
                  child: const Icon(
                    size: 15,
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: readCategorydctr(categoryname: categoryname),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something Went Wrong'),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data;
                      return OurList(
                        data: data!,
                        categorykey: categoryname,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

class OurList extends StatelessWidget {
  const OurList({
    Key? key,
    required this.data,
    required this.categorykey,
  }) : super(key: key);
  final List<OurDoctor> data;
  final String categorykey;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return SimpleShadow(
            opacity: 0.11, // Default: 0.5
            color: mgreya, // Default: Black
            offset: const Offset(
              5,
              6,
            ), // Default: Offset(2, 2)
            sigma: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AdoutDocter(
                        indexdoctor: index,
                        pagekey: 'category doctors',
                        categorykey: categorykey,
                      );
                    },
                  ));
                },
                child: Container(
                  //  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: radius15,
                    color: Colors.orange.shade900,
                  ),
                  height: 120,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: radius10,
                        ),
                        child: Image.network(data[index].image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Docter',
                                  style: TextStyle(fontSize: 15, color: mgreyb),
                                ),
                                Text(
                                  'Dr. ${data[index].doctorName} MBBS',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: mgreyb),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ScreenDateTime(
                                    id: data[index].id,
                                    pagekey: 'add Appoinment',
                                    image: data[index].image,
                                    category: data[index].category,
                                    doctorname: data[index].doctorName,
                                  );
                                },
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: mgreyb, borderRadius: radius5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                child: const Text(
                                  'Appoinment ',
                                  style: TextStyle(color: mBlack),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
        itemCount: data.length);
  }
}
