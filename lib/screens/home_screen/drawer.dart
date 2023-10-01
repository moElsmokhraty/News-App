import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(this.onDrawerCategoryClicked, {super.key});

  final Function onDrawerCategoryClicked;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            height: height * 0.2,
            width: double.infinity,
            child: const Center(
              child: Text(
                'News App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerCategoryClicked();
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(Icons.list_outlined, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              sendEmail('mailto:moelsmokhraty@gmail.com');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Row(
                children: [
                  Icon(Icons.info_outlined, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Contact Us',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sendEmail(String url) async {
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
