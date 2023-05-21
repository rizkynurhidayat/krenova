import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'batik_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              ListTile(
                leading: Image.network(
                  "https://lh3.googleusercontent.com/p/AF1QipOsOxdmuJu4gPD8RcF0NgtjDgWqrYsXIAnCGqT-=w600-h0",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: const Text("Toko Batik Elly"),
                subtitle: const Text(
                    "jl. projosumarto 2 kec. talang kab tegal. jawa tengah"),
                onTap: () {
                  Get.to(const BatikPage());
                },
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  color: Colors.grey,
                  width: 60,
                  height: 60,
                ),
                title: const Text("Coming Soon"),
                subtitle: const Text("Comming Soon"),
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  color: Colors.grey,
                  width: 60,
                  height: 60,
                ),
                title: const Text("Coming Soon"),
                subtitle: const Text("Comming Soon"),
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  color: Colors.grey,
                  width: 60,
                  height: 60,
                ),
                title: const Text("Coming Soon"),
                subtitle: const Text("Comming Soon"),
              ),
            ],
          )),
    );
  }
}
