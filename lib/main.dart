import 'package:flutter/material.dart';
import 'category_page.dart';
void main() {
  runApp(VideoPlayerApp());
}
class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink.shade50, // Pastel theme
      ),
      home: CategoryPage(),
    );
  }
}
