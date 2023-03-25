import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/data/mode.dart';
import 'package:krenova/presentation/pages/admin/add_data.dart';
import 'package:krenova/presentation/pages/home_user.dart';

import '../../controller/admin_home.dart';
import '../../widget/drawer.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminHomeController());
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Get.to(const AddPage());
        },
        icon: const Icon(Icons.add_box_rounded),
        label: const Text('add data'),
      ),
      appBar: AppBar(
        title: const Text('Admin'),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(const HomePage());
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
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
                    leading: Chip(label: Text((index + 1).toString())),
                    title: Text(batik.nama!),
                    subtitle: Text("${batik.detail!} | $id"),
                    onTap: () {
                      controller.showDetail(id);
                    },
                  );
                },
              );

              // return Text('berhasil');
            } else if (snapshot.hasError) {
              snapshot.printError();
            }
          } catch (err) {
            Exception(err);
          }
          return Text('something error with you');
        },
      )),
    );
  }
}

Future<void> refreshKu() async {
  await Future.delayed(const Duration(seconds: 2));
  Builder(
    builder: (context) => const AdminHomePage(),
  );
}
