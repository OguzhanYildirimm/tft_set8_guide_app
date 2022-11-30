import 'package:flutter/material.dart';

import 'pages/champions_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
      title: 'TFT Set8 Guide',
      theme: ThemeData(
      ),
      home: const ChampionsPage()
    );
  }
}