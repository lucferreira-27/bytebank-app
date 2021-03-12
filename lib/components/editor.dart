import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controller;
  final IconData icon;
  Editor({this.rotulo, this.dica, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
      ),
    );
  }
}