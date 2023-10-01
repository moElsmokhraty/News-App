import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, this.onCategoryClicked, {super.key});

  final Category category;
  final Function onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClicked(category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          color: category.backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${category.imagePath}'),
            Text(
              category.title,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
