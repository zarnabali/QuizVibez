import 'package:flutter/material.dart';

class OptionButtton extends StatelessWidget {
  const OptionButtton({super.key, required this.option, required this.onTap});

  final String option;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              backgroundColor: const Color.fromARGB(255, 102, 24, 116),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              )),
          child: Text(
            option,
            textAlign: TextAlign.center,
          )),
    );
  }
}
