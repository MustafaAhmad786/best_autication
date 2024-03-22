/* import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screen_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoCheck extends StatefulWidget {
  const AutoCheck({super.key});

  @override
  State<AutoCheck> createState() => _AutoCheckState();
}

class _AutoCheckState extends State<AutoCheck> {
  bool useravalibal = false;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    _getinstance();
  }

  void _getinstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      if (sharedPreferences.getString('employeeid') != null) {
        setState(() {
          User_.username = sharedPreferences.getString('employeeid')!;
          useravalibal = true;
        });
      }
    } catch (e) {
      setState(() {
        useravalibal = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return useravalibal ? HomePage() : LoginPage_();
  }
}
 */