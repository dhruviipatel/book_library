import 'dart:async';

import 'package:book_library/appColors.dart';
import 'package:book_library/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const HomeScreen());
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/main.png",
            height: 200,
          ),
          const Text(
            "Book Library",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      )),
    );
  }
}
