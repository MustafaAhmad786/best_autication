import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/Button_page.dart';
import 'package:flutter_application_1/models/apptext.dart';
import 'package:flutter_application_1/screen_page/flutter_toast.dart';
import 'package:flutter_application_1/screen_page/authotiction/login_page.dart';

class SginUp extends StatefulWidget {
  const SginUp({super.key});

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  TextEditingController Namecontroller = new TextEditingController();
  TextEditingController Passwordcontroller = new TextEditingController();
  TextEditingController Emailcontroller = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  bool ispasswordshow = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  SignUp() async {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: Emailcontroller.text, password: Passwordcontroller.text)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage_()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utails().toastmessage(error.toString());
    });

    // ignore: unnecessary_null_comparison
    /*  if (Password != null) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: Email, password: Password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Rigisterition is successfuly',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'password is provided is too weak',
                style: TextStyle(fontSize: 18),
              )));
        } else if (e.code == 'email-already sgin up') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exists',
                style: TextStyle(fontSize: 18),
              )));
        }
      }
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage_()));
                },
                child: Container(
                  height: 124,
                  width: 380,
                  child: Center(
                    child: Apptext(
                      text: 'Already you have an account?Login',
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      // sgin up area
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Apptext(
                              text: 'Sgin Up',
                              size: 25,
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'plase enter E-mail';
                                  }
                                  return null;
                                },
                                controller: Namecontroller,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Name',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'plase enter E-mail';
                                  }
                                  return null;
                                },
                                controller: Emailcontroller,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'plase enter E-mail';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                                controller: Passwordcontroller,
                                obscureText: !ispasswordshow,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            ispasswordshow = !ispasswordshow;
                                          });
                                        },
                                        icon: Icon(
                                            ispasswordshow
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black)),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(height: 25),
                            // button area
                            RoundButton(
                              loading: loading,
                              ontap: () {
                                if (formkey.currentState!.validate()) {
                                  SignUp();
                                }
                              },
                              text: 'SignUp',
                            )
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

  @override
  void dispose() {
    Passwordcontroller.dispose();
    super.dispose();
  }
}
