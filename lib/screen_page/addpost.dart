import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/Button_page.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final datebase = FirebaseDatabase.instance;
  var postcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Post'),
        ),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: postcontroller,
                  maxLines: 4,
                  maxLength: 26,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'add post'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field a post';
                    } else if (value.length < 4) {
                      return 'ae di ghala bachi';
                    }
                    return null;
                  },
                ),
              ),
              RoundButton(
                  color: Colors.transparent,
                  widthsize: 300,
                  ontap: () {},
                  text: 'add post')
            ],
          ),
        ));
  }
}
