import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  static String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(article.source?.name ?? ''),
        centerTitle: true,
        backgroundColor: const Color(0xff39A552),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CachedNetworkImage(
                imageUrl: article.urlToImage!,
                filterQuality: FilterQuality.high,
                imageBuilder: (context, imageProvider) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${article.source!.name}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '${article.title}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                article.publishedAt!.trim().substring(0, 10),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff39A552),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  article.content ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  launchInBrowser(article.url!);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff39A552),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_right,
                      size: 40,
                      color: Color(0xff39A552),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  launchInBrowser(String url) async {
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
