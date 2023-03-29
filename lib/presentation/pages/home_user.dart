import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:krenova/presentation/controller/firebase_service.dart';

import '../../data/mode.dart';

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
        return const Text('something error with you');
      },
    ));
  }
}
