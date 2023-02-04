import 'dart:developer';

import 'package:appoiment_docter/presantation/User%20pages/succes%20page/succes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../Domain/firebase functions/appoinment/add to firebase/add_appoinment.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';

class ScreenPaymnt extends StatefulWidget {
  const ScreenPaymnt(
      {super.key,
      required this.age,
      required this.category,
      required this.date,
      required this.doctorname,
      required this.genter,
      required this.image,
      required this.patiantname,
      required this.problem,
      required this.time});

  final String doctorname;
  final String patiantname;

  final String category;

  final String image;
  final String genter;
  final String problem;
  final int age;
  final TimeOfDay time;
  final DateTime date;

  @override
  State<ScreenPaymnt> createState() => _ScreenPaymntState();
}

class _ScreenPaymntState extends State<ScreenPaymnt> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    addappoinment(
      doctername: widget.doctorname,
      category: widget.category,
      genter: widget.genter,
      image: widget.image,
      problem: widget.problem,
      patientname: widget.patiantname,
      age: widget.age,
      date: widget.date,
      time: widget.time,
    );
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SuccesPage();
      },
    ));
    log('a');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('b');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('c');
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  String selectedValue = 'RazorPay';
  @override
  Widget build(BuildContext context) {
    final Size mysize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Payment',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
          Docterinfoa(
              category: widget.category,
              image: widget.image,
              name: widget.doctorname),
          const Spacer(),
          const Amount(charge: '₹490.00', text: 'Bokking Charge'),
          const Text(
            "consultatian fee for 1 hour",
            style: TextStyle(fontSize: 15, color: mGreyc),
          ),
          const Spacer(),
          const Amount(charge: '₹10.00', text: 'GST Amount'),
          const Divider(
            thickness: 2,
          ),
          const Total(),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Select  Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SimpleShadow(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: radius15,
                color: mWhite,
              ),
              child: ListTile(
                title: const Text('Online Payment'),
                trailing: Radio(
                  value: 'Razorpay',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          hsizedbox10,
          SimpleShadow(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: radius15,
                color: mWhite,
              ),
              child: ListTile(
                title: const Text('Cash on Hospital'),
                trailing: Radio(
                  value: 'Cash on Hospital',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
          TextButton(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_mkzSidhb6RgmDG',
                  'amount': 100 * 500,
                  'name': 'Aster Corp.',
                  'description': 'Demo',
                  'prefill': {
                    'contact': '7034612195',
                    'email': 'riyazmuhammad786rz@gmail.com'
                  },
                  'external': {
                    'wallets': ['paytm']
                  }
                };

                if (selectedValue == 'Cash on Hospital') {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Conform Your Appoinment',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () async {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SuccesPage();
                        },
                      ));
                    },
                  );

                  addappoinment(
                    doctername: widget.doctorname,
                    category: widget.category,
                    genter: widget.genter,
                    image: widget.image,
                    problem: widget.problem,
                    patientname: widget.patiantname,
                    age: widget.age,
                    date: widget.date,
                    time: widget.time,
                  );
                } else if (selectedValue == 'Razorpay') {
                  try {
                    _razorpay.open(options);
                  } catch (e) {
                    log(e.toString());
                  }
                }
              },
              child: Container(
                decoration:
                    const BoxDecoration(borderRadius: radius10, color: cmain),
                width: double.infinity,
                height: 45,
                child: const Center(
                    child: Text(
                  'Conform Your payment',
                  style: TextStyle(color: mWhite),
                )),
              )),
        ],
      ),
    )));
  }
}

class Total extends StatelessWidget {
  const Total({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Total Amount',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '₹500.00',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Docterinfoa extends StatelessWidget {
  const Docterinfoa(
      {Key? key,
      required this.image,
      required this.name,
      required this.category})
      : super(key: key);
  final String image;
  final String name;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: radius15,
        color: cmaina,
      ),
      height: 160,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        wsizedbox5,
        Expanded(
          child: Image.network(image
              //  fit: BoxFit.c,
              ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mgreyb),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: mgreya),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 36,
        )
      ]),
    );
  }
}

class Amount extends StatelessWidget {
  const Amount({
    Key? key,
    required this.text,
    required this.charge,
  }) : super(key: key);
  final String charge;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        Text(
          charge,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
