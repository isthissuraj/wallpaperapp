import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                height: 50,
                width: 100,
                fit: BoxFit.cover,
                "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black26),
          ),
          const Positioned(
              left: 35,
              top: 15,
              child: Text(
                "Cars",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
