import 'package:flutter/material.dart';
import 'package:wweek16_api/views/DetailsHome.dart';
import 'package:wweek16_api/views/RecipesHome.dart';

import 'Sql/SqlProvider.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await FoodProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RecipesHome(),
      //DetailsHome(),


    );
  }
}

