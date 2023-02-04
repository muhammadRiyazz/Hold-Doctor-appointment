import 'dart:developer';

import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/User%20pages/screen%20category/screen_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../Domain/firebase functions/doctor/read from firebase/read_categoreis.dart';

class Categoreis extends StatelessWidget {
  Categoreis({
    Key? key,
  }) : super(key: key);

  Future<List<String>> setAllDocumentInsideCategories() async {
    List<String> idList = [];
    var collection = FirebaseFirestore.instance.collection('categoreis');

    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id; // <-- Document ID
      log(documentID);

      idList.add(documentID);
    }
    return idList;
  }

  @override
  Widget build(BuildContext context) {
    final msize = MediaQuery.of(context).size;
    return SizedBox(
      height: 65,
      child: FutureBuilder(
        future: setAllDocumentInsideCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Somethinng Went Wrong'),
            );
          } else if (snapshot.hasData) {
            final datalist = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimpleShadow(
                    color: cmain,
                    opacity: 1,
                    sigma: 0,
                    // offset: Offset(6, 16),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ScreenCategoreis(
                                  categoryname: datalist[index],
                                );
                              },
                            ));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: cmain, borderRadius: radius10),
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              datalist[index],
                              style: const TextStyle(color: mWhite),
                            ),
                          ),
                        )));
              },
              itemCount: datalist.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
