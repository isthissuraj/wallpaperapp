import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaperapp/model/photosModel.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchReasultList = [];

// trending wallpaper method
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

// serach wallpaper method

  searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "2e7mdYOSgtT8kwaYmff5jqPrkgpTAKXkZfn6t0H1ns2nxdIm887fJ7aP"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      searchReasultList.clear();
      photos.forEach((element) {
        searchReasultList.add(PhotosModel.fromApiToApp(element));
      });
    });

    return searchReasultList;
  }
}

// emojies 🎶😎