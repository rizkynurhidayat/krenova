import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_service.dart';

class AdminHomeController extends DataBaseController {
  void showDetail(String id) {
    Get.defaultDialog(
        title: 'Edit Data id: $id',
        content: SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 270,
                child: TextField(
                  controller: nama,
                  decoration: InputDecoration(
                      hintText: 'nama motif batik',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              SizedBox(
                width: 270,
                child: TextField(
                  controller: detail,
                  decoration: InputDecoration(
                      hintText: 'detail motif batik',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              SizedBox(
                width: 270,
                child: TextField(
                  controller: link,
                  decoration: InputDecoration(
                      hintText: 'link filter IG',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              SizedBox(
                width: 270,
                child: TextField(
                  controller: foto,
                  decoration: InputDecoration(
                      hintText: 'link foto motif batik',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                updateData(id);
                Get.back();
              },
              child: const Text('Update')),
          ElevatedButton(
              onPressed: () {
                delData(id);
                Get.back();
              },
              child: const Text('Delete')),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel')),
        ]);
  }
}
