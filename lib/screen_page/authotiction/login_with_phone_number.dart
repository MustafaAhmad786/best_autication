import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Button_page.dart';
import 'package:flutter_application_1/screen_page/authotiction/verify_code.dart';
import 'package:flutter_application_1/screen_page/flutter_toast.dart';

class LoginwithPhoneNumber extends StatefulWidget {
  const LoginwithPhoneNumber({super.key});

  @override
  State<LoginwithPhoneNumber> createState() => _LoginwithPhoneNumberState();
}

class _LoginwithPhoneNumberState extends State<LoginwithPhoneNumber> {
  final phonecontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Phone')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: phonecontroller,
                decoration: InputDecoration(hintText: '+123 456 123'),
              ),
              SizedBox(height: 50),
              RoundButton(
                loading: loading,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: phonecontroller.text,
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        Utails().toastmessage(e.toString());
                      },
                      codeSent: (String verificationid, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerfiyCodeSent(
                                      verificationid: verificationid,
                                    )));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utails().toastmessage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                },
                text: 'verfiy',
              )
            ],
          ),
        ));
  }
}
