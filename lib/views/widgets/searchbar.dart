import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(66, 192, 192, 192),
          border: Border.all(color: Color.fromARGB(30, 0, 0, 0)),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: () => print("searching"), child: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
