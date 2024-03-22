// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/user.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/apptext.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  int intindex = 0; // Declare iconcolor at the class level
  List colorchange = [Colors.black, Colors.red, Colors.black];

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.height;

    // final globalkey = GlobalKey<FormState>();

    DateTime now = DateTime.now();

    String month = DateFormat('-MMMM').format(now);
    String year = DateFormat('-yyyy').format(now);

    String formattedDate = '$month $year';
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('attendance app'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Apptext(
                  text: 'Welcome',
                  color: Colors.black54,
                  fontweight: FontWeight.normal,
                  size: 24,
                ),
                Apptext(
                  text: 'Employee' + User_.username,
                  color: Colors.black,
                  size: 28,
                ),
                SizedBox(
                  height: 5,
                ),
                Apptext(
                  text: 'Todays Status',
                  color: Colors.black,
                  fontweight: FontWeight.normal,
                  size: 26,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: screenheight / 5,
                  width: screenWidth / 1.3,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Apptext(
                              text: 'check-In',
                              size: 20,
                              fontweight: FontWeight.normal,
                            ),
                            Apptext(
                              text: '09:00',
                              size: 24,
                              fontweight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Apptext(
                              text: 'check-Out',
                              size: 20,
                              fontweight: FontWeight.normal,
                            ),
                            Apptext(
                              text: '04:00',
                              size: 24,
                              fontweight: FontWeight.normal,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Apptext(
                      text: DateTime.now().day.toString(),
                      size: 27,
                      color: Colors.redAccent,
                    ),
                    Apptext(
                      text: formattedDate,
                      size: 27,
                    )
                  ],
                ),
                StreamBuilder(
                    stream: Stream.periodic(Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Container(
                        child: Apptext(
                          text:
                              DateFormat('hh:mm:ss: a').format(DateTime.now()),
                          fontweight: FontWeight.normal,
                          size: 24,
                        ),
                      );
                    }),
                Container(
                  child: Builder(builder: (context) {
                    final GlobalKey<SlideActionState> key = GlobalKey();
                    return SlideAction(
                      text: 'best of luck',
                      innerColor: Colors.blue,
                      key: key,
                      onSubmit: () async {
                        print(DateFormat('hh mm ss a').format(DateTime.now()));
                        // ignore: unused_local_variable
                        QuerySnapshot snap = await FirebaseFirestore.instance
                            .collection('Eployee')
                            .where('id', isEqualTo: User_())
                            .get();
                      },
                    );
                  }),
                ),
                // Center(
                //   child: InkWell(
                //     onTap: () {
                //       setState(() {
                //         intindex = (intindex + 1) % colorchange.length;
                //       });
                //     },
                //     child: Container(
                //       child: Icon(
                //         Icons.lightbulb_sharp,
                //         color: colorchange[intindex],
                //         size: 100,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
