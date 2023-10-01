import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/models/category.dart';
import 'drawer.dart';
import 'home_tabs.dart';
import 'news_search.dart';
import 'package:news_app/screens/categories_screen/categories_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Source> sourcesNames = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sourcesNames.length,
      initialIndex: 0,
      child: Scaffold(
        drawer: MyDrawer(onDrawerCategoryClicked),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: const Color(0xff39A552),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          title: const Text(
            'News App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          titleSpacing: 20,
          actions: selectedCategory != null
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      icon: const Icon(Icons.search_outlined),
                      onPressed: () {
                        showSearch(context: context, delegate: NewsSearch());
                      },
                    ),
                  )
                ]
              : null,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/background.png',
              fit: BoxFit.fill,
            ),
            selectedCategory != null
                ? HomeTabs(selectedCategory!.id)
                : CategoriesScreen(onCategoryClicked)
          ],
        ),
      ),
    );
  }

  Category? selectedCategory;

  void onCategoryClicked(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerCategoryClicked() {
    selectedCategory = null;
    setState(() {});
  }
}
