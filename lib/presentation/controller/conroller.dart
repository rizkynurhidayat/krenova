import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krenova/presentation/pages/tutorial_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isopen = false.obs;

  void isOpen() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    isopen.value = await pref.setBool("open", true);
  }
}
