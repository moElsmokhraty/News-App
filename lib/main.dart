import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/details_screen/news_details.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewsDetails.routeName: (_) => const NewsDetails(),
      },
    );
  }
}
