import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Button_page.dart';
import 'package:flutter_application_1/screen_page/Home_page.dart';

class VerfiyCodeSent extends StatefulWidget {
  const VerfiyCodeSent({super.key, required this.verificationid});
  final String verificationid;
  @override
  State<VerfiyCodeSent> createState() => _VerfiyCodeSentState();
}

class _VerfiyCodeSentState extends State<VerfiyCodeSent> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verfiycontroller = TextEditingController();
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
                keyboardType: TextInputType.number,
                controller: verfiycontroller,
                decoration: InputDecoration(hintText: '6 digit code'),
              ),
              SizedBox(height: 50),
              RoundButton(
                loading: loading,
                ontap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credital = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: verfiycontroller.text.toString()
                      
                      );
                  try {
                    await auth.signInWithCredential(credital);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                         setState(() {
                    loading = false;
                  });
                  } catch (e) {
                          setState(() {
                    loading = false;
                  });
                  }
                },
                text: 'verfiy',
              )
            ],
          ),
        ));
  }
}
