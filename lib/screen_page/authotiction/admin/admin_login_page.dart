import 'dart:ui';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({
    super.key,
  });

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

var coloR = Colors.red;
var coloB = Colors.black;

class _AdminLoginState extends State<AdminLogin> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 174, 174, 169),
        body: Container(
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: screenheight / 2.7),
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: screenheight,
                  width: screenwidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(screenwidth / 1.5, 110.0),
                      ))),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text(
                        "Let's start with \nAdmin!",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: screenheight / 2.2,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(97, 159, 154, 154),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, right: 20),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'email is not vilad';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, right: 20),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'email is not vilad';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 17.0),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  width: screenwidth,
                                  decoration: BoxDecoration(
                                      color: coloB,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  LoginAdmin() {}
}
