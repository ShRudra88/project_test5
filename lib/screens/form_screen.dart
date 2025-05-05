import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(title: Text("Form page"))),
        body: Text("this is from page"),
    );
  }
}
