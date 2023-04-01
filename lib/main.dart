import 'package:flutter/material.dart';
import 'package:movies/page/mainpage.dart';
import 'package:movies/page/splashscreen.dart';
import 'package:movies/provider/movieprovider.dart';
import 'package:movies/provider/searchprovider.dart';
import 'package:movies/provider/tvshowprovider.dart';
import 'package:provider/provider.dart';
import 'utilis/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TVShowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themedata(),
        home: const SplashScreen(),
      ),
    );
  }
}
