import 'dart:developer';

import 'package:appoiment_docter/presantation/User%20pages/screen%20main/screen_main.dart';
import 'package:appoiment_docter/presantation/intro%20and%20log%20in%20page/widgets/snckbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constands.dart';

import '../screen login/screen_login.dart';

class Screenforget extends StatelessWidget {
  Screenforget({super.key});

  TextEditingController emailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //const Spacer(flex: 1),
                Center(
                  child: SizedBox(
                      height: 220,
                      width: 220,
                      child: Image.asset('lib/assets/Group 36074.png')),
                ),
                //  const Spacer(flex: 1),
                const Center(
                  child: Text(
                    'Reset Your Password',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                hsizedbox10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must fill this field';
                      } else if (!value.contains('@')) {
                        return "Enter valid emil Id";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                      focusColor: mBlack,
                      border: OutlineInputBorder(borderRadius: radius15),
                      hintText: "Email",
                    ),
                  ),
                ),
                hsizedbox10,
                TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        return await reset(context);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: radius10, color: cmain),
                      width: double.infinity,
                      height: 50,
                      child: const Center(
                          child: Text(
                        'Reset Password',
                        style: TextStyle(color: mWhite),
                      )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future reset(context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim())
          .then((value) {
        showSnakbar('Plz check your email', context);
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      showSnakbar(e.message, context);
    }

    /////////
    // await FirebaseAuth.instance
    //     .sendPasswordResetEmail(email: emailcontroller.text.trim())
    //     .onError((error, stackTrace) {

    //     });
  }
}
