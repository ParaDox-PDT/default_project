import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetTextField extends StatelessWidget {
  const GetTextField({super.key, required this.hintText, required this.textInputFormatter, required this.title, required this.controller,this.controllerText="", required this.changed});
  final String hintText;
  final String title;
  final TextInputFormatter textInputFormatter;
  final TextEditingController controller;
  final String controllerText;
  final ValueChanged changed;


  @override
  Widget build(BuildContext context) {
    controller.text=controllerText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      ],
    );
  }
}
