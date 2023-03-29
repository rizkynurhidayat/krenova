import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:krenova/presentation/controller/firebase_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/mode.dart';
import '../controller/conroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataBaseController());
    return Center(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: controller.getAllData(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final id = data[index].id;
                final batik = BatikModel.fromJson(data[index].data());
                return ListTile(
                  onTap: () {
                    controller.openlink(batik.link!);
                  },
                  leading: Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                  ),
                  title: Text(batik.nama!),
                  subtitle: Text("${batik.detail!} | $id"),
                );
              },
            );
          } else if (snapshot.hasError) {
            snapshot.printError();
          }
        } catch (err) {
          print(err);
        }
        return Text('something error with you');
      },
    ));
  }
}

Future<void> refreshKu() async {
  await Future.delayed(const Duration(seconds: 2));
  Builder(
    builder: (context) => const HomePage(),
  );
}
