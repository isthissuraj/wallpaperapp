import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              text: "Wall",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: "Hub",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent))
              ])),
    );
  }
}
