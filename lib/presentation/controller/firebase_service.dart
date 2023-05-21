import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:krenova/data/mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'conroller.dart';

class DataBaseController extends HomeController {
  // Future<void> openlink(String url) async {
  //   Uri link = Uri.parse(url);
  //   if (url != null) {
  //     await launchUrl(link, mode: LaunchMode.externalNonBrowserApplication);
  //   } else {
  //     Get.showSnackbar(const GetSnackBar(
  //       duration: Duration(seconds: 2),
  //       title: 'Error Bro Bro',
  //       message: 'aplikasinya gk bisa dibuka',
  //     ));
  //   }
  // }

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

  void onklik(BatikModel batik) {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(20),
        titlePadding: EdgeInsets.all(15),
        title: (batik.nama == null) ? "Nama Motif Batik" : batik.nama!,
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 200,
                color: Colors.grey,
                child: Image.network(
                  batik.foto!,
                  fit: BoxFit.cover,
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deskripsi Motif",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Text(
                  batik.detail!,
                  textAlign: TextAlign.justify,
                ),
              )),
            ],
          ),
        ),
        textConfirm: "coba batik",
        confirm: ElevatedButton(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(300, 50)),
            ),
            onPressed: () async {
              Uri link = Uri.parse(batik.link!);
              if (batik.link != null) {
                await launchUrl(link,
                    mode: LaunchMode.externalNonBrowserApplication);
              } else {
                Get.showSnackbar(const GetSnackBar(
                  duration: Duration(seconds: 2),
                  title: 'Error Bro Bro',
                  message: 'aplikasinya gk bisa dibuka',
                ));
              }
            },
            child: const Text("coba batik")));
  }

  void openlink(String url) async {
    Uri link = Uri.parse(url);
    await launchUrl(link, mode: LaunchMode.externalNonBrowserApplication);
  }
}
