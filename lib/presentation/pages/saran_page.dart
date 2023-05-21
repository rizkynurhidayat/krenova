import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/presentation/controller/firebase_service.dart';

class SaranPage extends StatelessWidget {
  const SaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DataBaseController());
    return Scaffold(
      body: Center(
        child: Container(
          width: context.width - 100,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blueGrey[200],
          ),
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/icon.png",
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text("Kirimkan Kritik dan Saran anda"),
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(200, 40))),
                      onPressed: () {
                        c.openlink("https://wa.me/6285326544295");
                      },
                      icon: Icon(Icons.insert_comment),
                      label: const Text("Kirim Saran Kamu"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
