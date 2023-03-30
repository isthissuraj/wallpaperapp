import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/widgets/categoryblock.dart';
import 'package:wallpaperapp/views/widgets/customappbar.dart';
import 'package:wallpaperapp/views/widgets/searchbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      "https://images.pexels.com/photos/2909265/pexels-photo-2909265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38,
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                left: 150,
                top: 45,
                child: Column(
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Flowers",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 400),
                  itemCount: 16,
                  itemBuilder: ((context, index) => Container(
                        height: 800,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.cyanAccent,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 800,
                              width: 50,
                              fit: BoxFit.cover,
                              "https://images.pexels.com/photos/16000872/pexels-photo-16000872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
