import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_page/authotiction/forget_password_page.dart';
import 'package:flutter_application_1/models/Button_page.dart';
import 'package:flutter_application_1/models/apptext.dart';
import 'package:flutter_application_1/screen_page/authotiction/login_with_phone_number.dart';
import 'package:flutter_application_1/screen_page/flutter_toast.dart';
import 'package:flutter_application_1/screen_page/authotiction/registertion_page.dart';
import 'package:flutter_application_1/screen_page/Home_page.dart';

class LoginPage_ extends StatefulWidget {
  const LoginPage_({super.key});

  @override
  State<LoginPage_> createState() => _LoginPage_State();
}

class _LoginPage_State extends State<LoginPage_> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void Login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
      email: emailcontroller.text.toString(),
      password: passwordcontroler.text.toString(),
    )
        .then((value) {
      Utails().toastmessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      // debugPrint(error.toString());
      setState(() {
        loading = false;
      });
      Utails().toastmessage(error.toString());
    });
  }

/*   userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } on FirebaseException catch (e) {
      if (e.code == 'user is not found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'No user found for that email',
              style: TextStyle(fontSize: 20),
            )));
      } else if (e.code == 'wrong password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'wrong password provided by user',
          style: TextStyle(fontSize: 20),
        )));
      }
    }
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 243, 33, 236),
              Colors.amber,
              Color.fromARGB(255, 168, 37, 127),
            ]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 350,
            ),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SginUp()));
                      },
                      child: Apptext(
                          text: 'Already have an account? Sgin up', size: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    widthsize: 300,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginwithPhoneNumber()));
                    },
                    text: 'Phone Number',
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 5.5,
                shadowColor: Colors.amber,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Apptext(
                              text: 'Login',
                              size: 25,
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'email field';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: TextFormField(
                                controller: passwordcontroler,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password field';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.black,
                                    ),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Apptext(
                                    text: 'Forget Password?',
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 45),
                            RoundButton(
                              text: 'Login',
                              loading: loading,
                              ontap: () {
                                if (_formkey.currentState!.validate()) {
                                  Login();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
