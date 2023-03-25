import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krenova/presentation/controller/conroller.dart';
import 'package:krenova/presentation/pages/admin/add_data.dart';
import 'package:krenova/presentation/pages/admin/home_admin.dart';
import 'package:krenova/presentation/pages/home_user.dart';
import 'package:krenova/presentation/pages/login.dart';

class DrawerKu extends StatelessWidget {
  const DrawerKu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    return Drawer(
      backgroundColor: Colors.amber[700],
      child: Column(
        children: [
          const SizedBox(
              height: 50, child: Center(child: Text('Krenova Kita'))),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.offAll(const HomePage());
            },
            leading: const Icon(Icons.space_dashboard_rounded),
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              // Get.to(AboutPage());
            },
            leading: const Icon(Icons.info_outline_rounded),
          ),
          ListTile(
            title: const Text('Kritik & Saran'),
            onTap: () {},
            leading: const Icon(Icons.comment_rounded),
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Get.offAll(const LoginPage());
            },
            leading: const Icon(Icons.login_rounded),
          ),
        ],
      ),
    );
  }
}
