import 'package:flutter/material.dart';
import 'package:flutter_router_test/pages/home_page.dart';
import 'package:flutter_router_test/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const StartPage()
      },
      theme: ThemeData(
        useMaterial3: true
      ),
    );
  }
}
