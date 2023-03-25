import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/presentation/controller/firebase_service.dart';

import '../../controller/conroller.dart';
import 'home_admin.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataBaseController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 270,
              child: TextField(
                controller: controller.nama,
                decoration: InputDecoration(
                    hintText: 'nama motif batik',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(
              width: 270,
              child: TextField(
                controller: controller.detail,
                decoration: InputDecoration(
                    hintText: 'detail motif batik',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(
              width: 270,
              child: TextField(
                controller: controller.link,
                decoration: InputDecoration(
                    hintText: 'link filter IG',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(
              width: 270,
              child: TextField(
                controller: controller.foto,
                decoration: InputDecoration(
                    hintText: 'link foto motif batik',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.addData();
                },
                child: const Text('add')),
          ],
        ),
      ),
    );
  }
}
