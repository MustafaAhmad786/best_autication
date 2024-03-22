import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_page/authotiction/admin/admin_login_page.dart';

import 'package:flutter_application_1/screen_page/authotiction/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA-hf2XS1lLv1fDZX8bQM_AfamwPFInSCc",
          appId: "1:520718708455:android:e54acd7180190991593c42",
          messagingSenderId: "520718708455",
          projectId: "fir-connection-58582"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: StreamBldr());
  }
} // this code is fast LoginPage_();

class StreamBldr extends StatefulWidget {
  const StreamBldr({super.key});

  @override
  State<StreamBldr> createState() => _StreamBldrState();
}

class _StreamBldrState extends State<StreamBldr> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return AdminLogin();
          } else {
            return LoginPage_();
          }
        }));
  }
}
