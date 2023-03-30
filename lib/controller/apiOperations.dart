import 'package:http/http.dart' as http;

class ApiOperations {
  getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "2e7mdYOSgtT8kwaYmff5jqPrkgpTAKXkZfn6t0H1ns2nxdIm887fJ7aP"
    }).then((value) => print(value.body));
  }
}
