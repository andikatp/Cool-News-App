import 'package:flutter/material.dart';
import 'package:news_cool_app/models/news_model.dart';
import 'package:news_cool_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import 'package:news_cool_app/provider/news_provider.dart';

import '../widgets/home-page/blurry_container.dart';
import '../widgets/home-page/container_contain_image.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<NewsProvider>(context).getNews(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<NewsProvider>(
                builder: (context, value, child) => ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    HeadlineWidget(
                      height: size.height * 0.5,
                      article: value.article[0],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Breaking News',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return BreakingNews(
                                  width: size.width * 0.5,
                                  article: value.article[index],
                                );
                              },
                            ),
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
}

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    Key? key,
    required this.width,
    required this.article,
  }) : super(key: key);

  final double width;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailScreen(article: article),
      )),
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerContainImage(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              width: width,
              height: 100,
              imageUrl: article.urlToImage,
            ),
            const SizedBox(height: 8),
            Text(
              article.title ?? 'No Title',
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              DateTime.now().difference(article.publishedAt!).inMinutes < 60
                  ? '${DateTime.now().difference(article.publishedAt!).inMinutes} Minutes Ago'
                  : '${DateTime.now().difference(article.publishedAt!).inHours} Hours Ago',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'by $article.author',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    Key? key,
    required this.height,
    required this.article,
  }) : super(key: key);

  final double height;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ContainerContainImage(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      width: double.infinity,
      height: height,
      imageUrl: article.urlToImage,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Colors.black45,
              Colors.black54,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BlurryContainer(
                child: Text(
                  'News of the day',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                article.title ?? 'No title',
                maxLines: 3,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailScreen(article: article),
                  ));
                },
                child: Row(
                  children: const [
                    Text(
                      'Learn More',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_right_alt)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
