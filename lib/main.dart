import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_cool_app/provider/news_provider.dart';
import 'package:news_cool_app/screens/discover_screen.dart';
import 'package:news_cool_app/screens/home_page_screen.dart';
import 'package:news_cool_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData().textTheme.apply(
                fontFamily: GoogleFonts.poppins().fontFamily,
                displayColor: Colors.white,
                bodyColor: Colors.white,
              ),
        ),
        initialRoute: MainScreen.routeName,
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
          HomePageScreen.routeName: (context) => const HomePageScreen(),
          DiscoverScreen.routeName: (context) => const DiscoverScreen(),
          
        },
      ),
    );
  }
}
