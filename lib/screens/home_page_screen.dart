import 'package:flutter/material.dart';
import 'package:news_cool_app/provider/news_provider.dart';
import 'package:provider/provider.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home-screen';
  

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<NewsProvider>(context, listen: false).getNews();
    setState(() {
      Future.delayed(const Duration(seconds: 10));
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : const Center(
              child: Text('as'),
            ),
    );
  }
}
