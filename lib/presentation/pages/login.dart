import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/presentation/controller/conroller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 270,
              child: TextField(
                controller: controller.admin,
                decoration: InputDecoration(
                    hintText: 'admin',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 270,
              child: TextField(
                obscureText: true,
                controller: controller.password,
                decoration: InputDecoration(
                    hintText: 'admin',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text("Login"))
          ],
        ),
      )),
    );
  }
}
