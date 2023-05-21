import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';

import '../../data/mode.dart';
import '../controller/firebase_service.dart';

class BatikPage extends StatelessWidget {
  const BatikPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataBaseController());
    return Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {
            controller.openlink("https://goo.gl/maps/LYp4vREpjDhHteJN8");
          },
          style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size.fromHeight(60))),
          child: const Icon(Icons.my_location_rounded),
        ),
        appBar: AppBar(
            toolbarHeight: 80,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Toko Batik Elly",
                ),
                Text(
                  "jl. projosumarto 2 kec. talang kab tegal. jawa tengah",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     controller
                //         .openlink("https://goo.gl/maps/LYp4vREpjDhHteJN8");
                //   },
                //   child: const Text(
                //     "jl. projosumarto 2 kec. talang kab tegal. jawa tengah",
                //     style: TextStyle(fontSize: 12.5, color: Colors.blue),
                //   ),
                //   style: ButtonStyle(
                //       foregroundColor: MaterialStatePropertyAll(Colors.black)),
                // )
              ],
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // width: Get.width,
                  height: 280,
                  child: Panorama(
                    child: Image.asset("assets/pano1.jpg"),
                    // maxLatitude: 30,
                    // minLatitude: -30,
                    // latSegments: 64,
                    // minZoom: 0.5,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: const Text(
                    "Motif Batik",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.getAllData(),
                  builder: (context, snapshot) {
                    try {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        final data = snapshot.data!.docs;

                        var a = List.generate(data.length, (index) {
                          final id = data[index].id;
                          final batik = BatikModel.fromJson(data[index].data());
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            onTap: () {
                              controller.onklik(batik);
                            },
                            leading: Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey,
                              child: Image.network(
                                batik.foto!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(batik.nama!),
                            subtitle: Text(
                              batik.detail!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          );
                        });
                        return Column(
                          children: a,
                        );
                      } else if (snapshot.hasError) {
                        snapshot.printError();
                      }
                    } catch (err) {
                      print(err);
                    }
                    return const Text('something error with you');
                  },
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  onTap: () {
                    ;
                  },
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
                  title: Text("Comming Soon"),
                  subtitle: Text(
                    "Comming Soon",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  onTap: () {
                    ;
                  },
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
                  title: Text("Comming Soon"),
                  subtitle: Text(
                    "Comming Soon",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  onTap: () {
                    ;
                  },
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
                  title: Text("Comming Soon"),
                  subtitle: Text(
                    "Comming Soon",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}
