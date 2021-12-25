import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garaj/is_logged_in.dart';
import 'package:garaj/viewmodel/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .doc(uid)
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      DocumentSnapshot? data = snap.data!;
                      Map<dynamic, dynamic> map =
                          json.decode(json.encode(data.data()));
                      return Text("${map['email']}");
                    }
                    return const CircularProgressIndicator();
                  }),
              ListTile(
                title: Text('logOut'.tr),
                onTap: () async {
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  shared.remove('uid');
                  setState(() {
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
