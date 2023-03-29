import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'package:lottie/lottie.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      // showSkipButton: true,
      showNextButton: true,
      showBackButton: true,
      // skip: const Text("Skip"),
      back: const Text('Back'),
      next: const Text(
        'Next >',
        style: TextStyle(color: Colors.black),
      ),
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }
}

List<PageViewModel> listPagesViewModel = [
  PageViewModel(
    title: "Halaman Tutorial AR",
    body: "Ini adalah aplikasi pencoba Batik tanpa harus mengenakannya",
    image: Lottie.asset('assets/lottie/metaverse.json'),
  ),
  PageViewModel(
    title: "Memerlukan Akun Tiktok",
    body: "Butuh akun tiktok agar filter ini bisa berjalan dengan lancar",
    image: Lottie.asset('assets/lottie/tiktok.json'),
  ),
  PageViewModel(
    title: "Pilih Motif Batik",
    body:
        "Pilih motif batik yang ingin anda coba dengan cara klik gambar batik di menu HOME",
    image: Lottie.asset('assets/lottie/tiktok.json'),
  ),
  PageViewModel(
    title: "Coba Filter Batik",
    body: "Silakan arahkan kamera hp ke badan anda",
    image: Lottie.asset('assets/lottie/cameraMove.json'),
  ),
  PageViewModel(
    title: "Selamat ",
    body: "anda berhasil mencoba batik kesukaan anda",
    image: Lottie.asset('assets/lottie/tiktok.json'),
  ),
];
