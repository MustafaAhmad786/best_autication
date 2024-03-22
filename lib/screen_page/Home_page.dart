import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen_page/authotiction/login_page.dart';
import 'package:flutter_application_1/screen_page/flutter_toast.dart';
import 'package:flutter_application_1/screen_page/addpost.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

final user = FirebaseAuth.instance.currentUser;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> sginout() async {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage_()))
            .onError(
                (error, stackTrace) => Utails().toastmessage(error.toString()));
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text('FireBase')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.login_rounded),
              title: Text('SignOut'),
              onTap: () {
                sginout();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddPost()));
      }),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          ////////
          ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(13),
                  // height: 200,
                  // width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.green,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        stops: [
                          0.4,
                          0.4,
                          0.5,
                          0.6,
                          0.8
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                        transform: GradientRotation(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: Colors.black,
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                    title: Text('mustafa'),
                    subtitle: Text('Best desginer'),
                  ),
                );
              })
        ],
      ),
    );
  }
}
