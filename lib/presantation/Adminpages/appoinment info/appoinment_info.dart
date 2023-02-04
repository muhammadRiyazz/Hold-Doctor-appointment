import 'package:appoiment_docter/Domain/firebase%20functions/appoinment/read%20data/read_appoinment.dart';
import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:appoiment_docter/core/constands.dart';
import 'package:appoiment_docter/presantation/Adminpages/screen%20home/Screen_admin_home.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../Domain/firebase functions/appoinment/delete appoinment/delete_appoinment.dart';
import '../screen main/screen main.dart';

class AdmnAppoimentInfo extends StatelessWidget {
  const AdmnAppoimentInfo({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    Size msize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Appoinment'),
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
          ),
          StreamBuilder(
            stream: readappoinmrnt(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Someting went wrong'),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return Expanded(
                  child: Column(
                    children: [
                      AdmnDocterPart(
                          msize: msize,
                          category: data[index].category,
                          doctorname: data[index].doctername,
                          image: data[index].image),
                      hsizedbox10,
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              //height: 500,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: radius20,
                                color: cmain,
                              ),
                            ),
                            Positioned(
                              top: 30,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: radius20,
                                  color: mgreyb,
                                ),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, right: 15, left: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AdnmScndPart(
                                              mainhead: 'Visit Time',
                                              firsttxt: data[index].date,
                                              scndtxt: data[index].time,
                                              icon: const Icon(
                                                Icons.alarm,
                                                size: 33,
                                                color: mGreyc,
                                              ),
                                            ),
                                            hsizedbox40,
                                            // hsizedbox20,
                                            AdnmScndPart(
                                              mainhead: 'Patient Information',
                                              firsttxt:
                                                  'Name  :  ${data[index].patientname}',
                                              scndtxt:
                                                  'Disease  :  ${data[index].problem}',
                                              icon: const Icon(
                                                  Icons.account_circle_outlined,
                                                  size: 33,
                                                  color: mGreyc),
                                            ),
                                            hsizedbox40,
                                            // hsizedbox20,
                                            const AdnmScndPart(
                                              mainhead: 'Fees Information',
                                              firsttxt: 'Paid',
                                              scndtxt: '₹500',
                                              icon: Icon(
                                                  Icons
                                                      .monetization_on_outlined,
                                                  size: 33,
                                                  color: mGreyc),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.warning,
                                          text: 'Conform to Delete',
                                          confirmBtnText: 'Yes',
                                          cancelBtnText: 'No',
                                          confirmBtnColor: Colors.green,
                                          onConfirmBtnTap: () async {
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                              builder: (context) {
                                                return adminScreenMain();
                                              },
                                            ), (route) => false);
                                            await deleteappoinment(
                                                id: data[index].id,
                                                mykey: 'admin dlt');
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: radius10,
                                            color: cmain),
                                        width: double.infinity,
                                        height: 45,
                                        child: const Center(
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(color: mWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                    hsizedbox15
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      )),
    );
  }
}

class AdnmScndPart extends StatelessWidget {
  const AdnmScndPart({
    required this.mainhead,
    required this.firsttxt,
    required this.scndtxt,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String mainhead;
  final String firsttxt;

  final String scndtxt;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        wsizedbox10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainhead,
              style: const TextStyle(
                  fontSize: 18.3, fontWeight: FontWeight.w500, color: mBlack),
            ),
            hsizedbox15,
            Text(
              firsttxt,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: mGreyc),
            ),
            hsizedbox5,
            Text(
              scndtxt,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: mGreyc),
            ),
          ],
        )
      ],
    );
  }
}

class AdmnDocterPart extends StatelessWidget {
  const AdmnDocterPart({
    Key? key,
    required this.msize,
    required this.doctorname,
    required this.category,
    required this.image,
  }) : super(key: key);

  final Size msize;
  final String doctorname;
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: msize.height * 0.18,
        decoration: const BoxDecoration(
            //borderRadius: radius15,
            //color: mgreya,
            ),
        child: Row(
          children: [
            SimpleShadow(
              opacity: 1, // Default: 0.5
              color: mgreya, // Default: Black
              offset: const Offset(
                7,
                7,
              ), // Default: Offset(2, 2)
              sigma: 4,
              child: Container(
                width: 120,
                decoration: const BoxDecoration(
                  borderRadius: radius15,
                  color: mWhite,
                ),
                child: Image.network(image),
              ),
            ),
            wsizedbox20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hsizedbox15,
                Text(doctorname,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                hsizedbox5,
                Text(category,
                    style: const TextStyle(
                      color: mGrey,
                      fontSize: 15,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
