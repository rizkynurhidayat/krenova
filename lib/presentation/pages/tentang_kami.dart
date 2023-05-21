import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/presentation/controller/conroller.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Batik Vision",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/icon.png"),
            ),
            const SizedBox(
              height: 150,
              child: Text(
                "Adalah aplikasi yang memungkinkan pengguna untuk melihat gambar batik tegalan melalui kamera smartphone mereka lalu menampilkan informasi tambahan tentang pola, sejarah dan makna yang muncul di layer perangkat dan dapat digunakan untuk pendidikan, wisata, atau bahkan keperluan bisnis seperti penjualan produk batik.",
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "Tim Kami",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              "assets/husni_fix.jpg",
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Muhammad Husni Nasuha",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Text("Ketua"),
                          const Text("Pembuat Ar & 3d Model",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              "assets/rizky.jpg",
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Rizky Nur Hidayat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Text("Anggota"),
                          const Text("Pembuat Aplikasi Android",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
