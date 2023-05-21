import 'package:flutter/material.dart';
import 'package:krenova/presentation/pages/home_user.dart';
import 'package:krenova/presentation/pages/tentang_kami.dart';
import 'package:krenova/presentation/pages/tutorial_page.dart';

import 'saran_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Batik Vision'),
            bottom: const TabBar(tabs: [
              // Tab(
              //   text: 'Tutorial',
              // ),
              Tab(
                text: 'Tentang Kami',
              ),
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Saran',
              ),
            ]),
          ),
          body: const TabBarView(children: [
            // TutorialPage()
            TentangKami(),
            HomePage(),
            SaranPage(),
          ]),
        ));
  }
}
