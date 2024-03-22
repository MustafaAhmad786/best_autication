
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/apptext.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';
  TextEditingController emailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Email password has been sent',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'No user found with that email',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 65),
        child: Column(
          children: [
            Center(
              child: Apptext(
                text: 'Password Recovery',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Apptext(
                text: 'Enter The Email',
                color: Colors.white,
                size: 24,
                fontweight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 30),
            Form(
              key: _formkey,
              child: Container(
                height: 57,
                margin: EdgeInsets.symmetric(horizontal: 19),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.white70),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  controller: emailcontroller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    email = emailcontroller.text;
                  });
                  resetpassword();
                }
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 2.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Apptext(
                    text: 'Send Email',
                    size: 22,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
