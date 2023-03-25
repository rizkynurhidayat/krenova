import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/mode.dart';
import 'conroller.dart';

class DataBaseController extends HomeController {
  Future<DocumentReference<Map<String, dynamic>>> addData() async {
    final now = DateTime.now();
    return firestore
        .collection('dataBatik')
        .add(BatikModel(
                nama: nama.text,
                detail: detail.text,
                link: link.text,
                foto: foto.text,
                addTime: now.toIso8601String(),
                updateTime: now.toIso8601String())
            .toJson())
        .whenComplete(() => clear());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllData() {
    return firestore
        .collection('dataBatik')
        .orderBy('addTime', descending: true)
        .snapshots();
  }

  void clear() {
    nama.clear();
    detail.clear();
    link.clear();
    foto.clear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firestore.disableNetwork();
  }

  void delData(String id) async {
    await firestore.collection('dataBatik').doc(id).delete();
  }

  void updateData(String id) async {
    final now = DateTime.now();
    await firestore.collection('dataBatik').doc(id).update(BatikModel(
            detail: detail.text,
            foto: foto.text,
            link: link.text,
            nama: nama.text,
            updateTime: now.toIso8601String())
        .toJson());
  }
}
