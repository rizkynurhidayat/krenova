import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:krenova/presentation/controller/firebase_service.dart';
import 'package:krenova/presentation/pages/dashboard.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DataBaseController());
    SharedPreferences pref;
    return IntroductionScreen(
      pages: listPagesViewModel,
      showSkipButton: true,
      showNextButton: true,
      // showBackButton: true,
      skip: const Text("Skip"),
      // back: const Text('Back'),
      next: const Text(
        'Next >',
        style: TextStyle(color: Colors.black),
      ),
      done: const Text("Done"),
      onDone: () async {
        // On button pressed
        if (c.isopen.isFalse) {
          c.isOpen();
          Get.off(const DashboardPage());
        } else if (c.isopen.isTrue) {
          Get.off(const DashboardPage());
        }
      },
    );
  }
}

List<PageViewModel> listPagesViewModel = [
  PageViewModel(
    title: "Selamat Datang",
    body:
        "Ini Adalah aplikasi yang memungkinkan pengguna untuk melihat gambar batik tegalan melalui kamera smartphone",
    image: Lottie.asset('assets/lottie/metaverse.json'),
  ),
  PageViewModel(
    title: "Perhatian !!!",
    body:
        "Butuh akun tiktok agar filter ini bisa berjalan dengan lancar, pastikan anda memilikinya",
    image: Lottie.asset('assets/lottie/tiktok.json'),
  ),
  PageViewModel(
    title: "Pilih Motif Batik",
    body:
        "Pilih motif batik yang ingin anda coba dengan cara klik gambar batik",
    image: Lottie.asset('assets/lottie/tiktok.json'),
  ),
  PageViewModel(
    title: "Coba Filter Batik",
    body: "Silakan arahkan kamera hp ke badan anda",
    image: Lottie.asset('assets/lottie/cameraMove.json'),
  ),
  PageViewModel(
    title: "Siap untuk mencoba???",
    body: "Selamat anda berhasil mencoba batik kesukaan anda",
    image: Lottie.asset('assets/lottie/metaverse.json'),
  ),
];
