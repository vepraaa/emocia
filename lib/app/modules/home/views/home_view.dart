import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 229, 115, 115),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red[100],
        ),
        child: Center(
          child: GestureDetector(
            onTap: () => controller.changeActiveIndex(),
          child: Card(
            elevation: 5,
            shape: 
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red[300],
              ),
              child: Center(
                child: Obx(() => Text(
                  controller.getActiveEmoji.data,
                  style: const TextStyle(fontSize: 80),
                )),
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
