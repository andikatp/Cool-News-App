import 'package:flutter/material.dart';

import 'package:news_cool_app/models/news_model.dart';
import 'package:news_cool_app/widgets/detail-page/tag_container.dart';
import 'package:news_cool_app/widgets/home-page/blurry_container.dart';
import 'package:news_cool_app/widgets/home-page/container_contain_image.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  static const routeName = '/detail-screen';
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: ContainerContainImage(
        width: double.infinity,
        height: double.infinity,
        imageUrl: article.urlToImage,
        borderRadius: BorderRadius.zero,
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
          child: ListView(
            children: [
              NewsAbovePart(article: article),
              NewsBody(article: article)
            ],
          ),
        ),
      ),
    );
  }
}

class NewsBody extends StatelessWidget {
  const NewsBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TagContainer(
                bgColor: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/404-4042686_my-profile-person-icon-png-free-transparent-png.png'),
                      radius: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      article.author ?? 'No Author',
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              TagContainer(
                bgColor: Colors.grey,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time),
                    Text(
                      '${DateTime.now().difference(article.publishedAt!).inHours}h',
                      style: const TextStyle(letterSpacing: 3),
                    )
                  ],
                ),
              ),
              TagContainer(
                bgColor: Colors.grey,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.remove_red_eye_outlined),
                    Text(
                      '376',
                      style: TextStyle(letterSpacing: 3),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            article.title ?? 'No Title',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            article.content ?? 'No Content',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.25),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContainerContainImage(
                width: MediaQuery.of(context).size.width * 42,
                imageUrl: article.urlToImage,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewsAbovePart extends StatelessWidget {
  const NewsAbovePart({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const BlurryContainer(
            child: Text(
              'News of the day',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            article.title ?? 'No title',
            maxLines: 2,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 20),
          Text(
            article.description ?? 'No Description',
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
