import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/home_page.dart';
import 'package:flutter_navigation/provider_(unused)/fetch_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => FetchProvider(),
        )
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
