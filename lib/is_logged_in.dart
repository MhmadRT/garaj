import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garaj/view/screen/home_screen.dart';
import 'package:garaj/view/screen/loading_screen.dart';
import 'package:garaj/view/screen/login_screen.dart';
import 'package:garaj/viewmodel/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLoggedIn extends StatefulWidget {
  const IsLoggedIn({Key? key}) : super(key: key);

  @override
  _IsLoggedInState createState() => _IsLoggedInState();
}

class _IsLoggedInState extends State<IsLoggedIn> {
  bool isLoading = true;

  @override
  void initState() {
    checkUserInStorage();
    super.initState();
  }

  checkUserInStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('uid')) {
      uid = sharedPreferences.getString('uid');
      isLoading = false;
    } else {
      uid = null;
      isLoading = false;
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    checkUserInStorage();
    return isLoading
        ? const LoadingScreen()
        : uid == null
            ? const LoginScreen()
            : const HomeScreen();
  }
}
