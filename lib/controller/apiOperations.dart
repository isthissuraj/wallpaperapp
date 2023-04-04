import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaperapp/model/photosModel.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "2e7mdYOSgtT8kwaYmff5jqPrkgpTAKXkZfn6t0H1ns2nxdIm887fJ7aP"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromApiToApp(element));
      });
    });

    return trendingWallpapers;
  }
}

// emojies 🎶😎