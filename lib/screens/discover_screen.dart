import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  static const routeName = '/discover-screen';

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
        ],
      )),
    );
  }
}
