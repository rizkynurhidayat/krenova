import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nama = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController foto = TextEditingController();
  TextEditingController link = TextEditingController();
}
