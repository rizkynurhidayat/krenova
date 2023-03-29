import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firestore.disableNetwork();
  }
}
