import 'package:flutter/material.dart';
import 'package:news_cool_app/provider/news_provider.dart';
import 'package:news_cool_app/screens/detail_screen.dart';
import 'package:news_cool_app/widgets/home-page/container_contain_image.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  static const routeName = '/discover-screen';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  FocusNode search = FocusNode();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Arts', 'Food', 'Science'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
          body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SearchBar(search: search),
          TabNews(
            tabs: tabs,
          )
        ],
      )),
    );
  }
}

class TabNews extends StatelessWidget {
  const TabNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: tabs
                .map((tab) => Tab(
                      icon: Text(
                        tab,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList()),
        Consumer<NewsProvider>(
          builder: (context, value, child) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
                children: tabs
                    .map((e) => ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      article: value.article[index]),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  ContainerContainImage(
                                    width: 80,
                                    height: 80,
                                    imageUrl: value.article[index].urlToImage,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          value.article[index].title ??
                                              'No title',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.schedule,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              DateTime.now()
                                                          .difference(value
                                                              .article[index]
                                                              .publishedAt!)
                                                          .inMinutes <
                                                      60
                                                  ? '${DateTime.now().difference(value.article[index].publishedAt!).inMinutes} Minutes Ago'
                                                  : '${DateTime.now().difference(value.article[index].publishedAt!).inHours} Hours Ago',
                                            ),
                                            const SizedBox(width: 20),
                                            const Icon(Icons.visibility),
                                            const SizedBox(width: 5),
                                            const Text(
                                              '1380 views',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          shrinkWrap: true,
                          itemCount: value.article.length,
                        ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.search,
  });

  final FocusNode search;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Text(
          'News from Indonesia',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        TextFormField(
          focusNode: search,
          onTapOutside: (event) => search.unfocus(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.grey,
            hoverColor: Colors.white,
            focusColor: Colors.white,
            filled: true,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIconColor: Colors.white,
            prefixIconColor: Colors.white,
            suffixIcon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.tune),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
