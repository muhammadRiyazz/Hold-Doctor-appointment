import 'package:appoiment_docter/Domain/models/doctor_modal.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/presantation/Adminpages/Dctor%20info/docter_info.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20adddoctor/add_doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../Domain/firebase functions/doctor/read from firebase/read_all_doctors.dart';
import '../../../core/constands.dart';
import '../../intro and log in page/screen firstlog/screen_firstlog.dart';
import '../popular doctors/populardoctor.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Doctors',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const AuthScreen();
                      },
                    ), (route) => false);
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          StreamBuilder(
              stream: morereaddata(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('something went worng'),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  if (data == null) {
                    return const Center(
                      child: Text('No data found'),
                    );
                  } else {
                    return DataList(data: data);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Adddoctor(
                    pagekey: 'all doctor',
                  );
                },
              ));
            },
            child: Container(
              decoration:
                  const BoxDecoration(borderRadius: radius10, color: cmain),
              // width: double.infinity,
              height: 50,
              child: const Center(
                child: Text(
                  'Add Doctor',
                  style: TextStyle(color: mWhite),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ScreenPopulardoctor();
                },
              ));
            },
            child: Container(
              decoration:
                  const BoxDecoration(borderRadius: radius10, color: cmain),
              width: double.infinity,
              height: 50,
              child: const Center(
                child: Text(
                  'Go pupular doctors page',
                  style: TextStyle(color: mWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataList extends StatelessWidget {
  const DataList({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<OurDoctor> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return SimpleShadow(
              opacity: 0.11, // Default: 0.5
              //color: mgreya, // Default: Black
              offset: const Offset(
                5,
                6,
              ), // Default: Offset(2, 2)
              sigma: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return InfoDocter(
                          pagekey: 'all doctors',
                          index: index,
                        );
                      },
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      borderRadius: radius15,
                      color: mWhite,
                    ),
                    height: 110,
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: radius10,

                            //color: mgreya
                          ),
                          child: Image.network(data[index].image),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Doctor',
                                  style: TextStyle(fontSize: 15, color: mGrey),
                                ),
                                Text(
                                  data[index].doctorName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                    ]),
                  ),
                ),
              ),
            );
          },
          itemCount: data.length),
    );
  }
}
