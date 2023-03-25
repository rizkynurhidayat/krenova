import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:krenova/presentation/pages/home_user.dart';

import '../pages/admin/home_admin.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nama = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController foto = TextEditingController();
  TextEditingController link = TextEditingController();

  ///
  ///untuk user
  ///
  var isKlik = false.obs;
  TextEditingController admin = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (admin.text == 'admin' && password.text == 'admin') {
      Get.off(const AdminHomePage());
    }
    admin.clear();
    password.clear();
  }

  void goDashboard() {
    Get.to(HomePage());
    isKlik.toggle();
  }
}
