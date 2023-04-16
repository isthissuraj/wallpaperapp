import 'package:flutter/material.dart';
import 'package:wallpaperapp/controller/apiOperations.dart';
import 'package:wallpaperapp/model/categoryModel.dart';
import 'package:wallpaperapp/model/photosModel.dart';
import 'package:wallpaperapp/views/screens/fullScreen.dart';
import 'package:wallpaperapp/views/widgets/categoryblock.dart';
import 'package:wallpaperapp/views/widgets/customappbar.dart';
import 'package:wallpaperapp/views/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> trendingWallList = [];
  late List<CategoryModel>? catModList;
  bool isLoading = true;

  getCatDetails() async {
    catModList = await ApiOperations.getCategoriesList();
    print("GETTING CATEGORY MOD LIST");
    print(catModList);
    setState(() {
      catModList = catModList;
    });
  }

  getTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTrendingWallpapers();
    getCatDetails();
  }

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SearchBar(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: catModList?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => CategoryBlock(
                        categoryImgSrc: catModList![index].catImgUrl,
                        categoryName: catModList![index].catName,
                      )),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 700,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 400),
                  itemCount: trendingWallList.length,
                  itemBuilder: ((context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imgUrl:
                                            trendingWallList[index].imgSrc)));
                          },
                          child: Hero(
                            tag: trendingWallList[index].imgSrc,
                            child: Container(
                              height: 800,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orangeAccent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    height: 800,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    trendingWallList[index].imgSrc),
                              ),
                            ),
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
