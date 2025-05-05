import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts"),),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.to(() => FormScreen()),
        child: Icon(Icons.ac_unit_rounded),
      ),
    );
  }
}
