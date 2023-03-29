import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:external_app_launcher/external_app_launcher.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/mode.dart';
import 'conroller.dart';

class DataBaseController extends HomeController {
  Future<void> openlink(String url) async {
    Uri link = Uri.parse(url);
    if (url != null) {
      await launchUrl(link, mode: LaunchMode.externalNonBrowserApplication);
    } else {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 2),
        title: 'Error Bro Bro',
        message: 'aplikasinya gk bisa dibuka',
      ));
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllData() {
    return firestore
        .collection('dataBatik')
        .orderBy('nama', descending: true)
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
          link: link.text,
          nama: nama.text,
        ).toJson());
  }
}
