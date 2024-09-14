// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  CustomRoundedButton(
      {super.key,
      required this.color,
      required this.name,
      required this.onTap});
  Color color;
  String name;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          name,
          style: Theme.of(context).textTheme.labelLarge,
        )),
      ),
    );
  }
}
