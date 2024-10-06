import 'package:flutter/material.dart';
import 'package:image_labeling/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Labeling',
      home: MyHomePage(),
    );
  }
}
