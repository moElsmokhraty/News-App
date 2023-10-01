import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen(this.onCategoryClicked, {super.key});

  final Function onCategoryClicked;

  final List<Category> categories = [
    Category(
      id: 'sports',
      title: 'Sports',
      imagePath: 'sports.png',
      backgroundColor: Colors.red,
    ),
    Category(
      id: 'technology',
      title: 'technology',
      imagePath: 'technology.png',
      backgroundColor: const Color(0xff003E90),
    ),
    Category(
      id: 'health',
      title: 'health',
      imagePath: 'health.png',
      backgroundColor: Colors.pink,
    ),
    Category(
      id: 'business',
      title: 'business',
      imagePath: 'business.png',
      backgroundColor: Colors.brown,
    ),
    Category(
      id: 'science',
      title: 'science',
      imagePath: 'science.png',
      backgroundColor: Colors.blueAccent,
    ),
    Category(
      id: 'entertainment',
      title: 'entertainment',
      imagePath: 'entertainment.png',
      backgroundColor: Colors.orange,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'Pick your category \n of interest',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff4F5A69),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(categories[index], onCategoryClicked);
              },
            ),
          )
        ],
      ),
    );
  }
}
