import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/widgets/customappbar.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});
  final Uri _url = Uri.parse("https://github.com/isthissuraj/wallpaperapp");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const CustomAppBar(),
        ),
        body: Center(
          child: Container(
            // padding: EdgeInsets.all(100),
            height: 150,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "developed by Suraj",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Text("source code"),
                ElevatedButton(
                    onPressed: _launchUrl, child: const Text("GitHub link"))
              ],
            ),
          ),
        ));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception("could not launch $_url");
    }
  }
}
