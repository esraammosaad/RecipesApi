import 'package:flutter/material.dart';
import 'package:wweek16_api/views/RecipesHome.dart';

import 'Sql/SqlProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FoodProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipesHome(),
    );
  }
}
