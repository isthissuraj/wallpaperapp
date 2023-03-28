import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/widgets/categoryblock.dart';
import 'package:wallpaperapp/views/widgets/customappbar.dart';
import 'package:wallpaperapp/views/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomAppBar(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SearchBar(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 30,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoryBlock()),
            ),
          )
        ],
      ),
    );
  }
}
