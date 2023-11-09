import 'package:flutter/material.dart';
import '../ApI/RecipesApi.dart';
import '../Sql/SqlProvider.dart';
import '../models/RecipesModal.dart';

class FavHome extends StatefulWidget {
  const FavHome({super.key});

  @override
  State<FavHome> createState() => _RecipesHomeState();
}

class _RecipesHomeState extends State<FavHome> {
  RecipesApi api1 = RecipesApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.favorite_border)),
          const Icon(Icons.play_arrow_outlined),
          const Icon(Icons.shopping_cart_outlined),
          const Icon(Icons.share),
        ],
      ),
      body: FutureBuilder<List<RecipesModels>?>(
        //The data from where ?
        future: FoodProvider.instance.getAllRecipes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      child: Card(
                        child: Column(children: [
                          Image.network(snapshot.data.elementAt(i).image),
                          Text(snapshot.data.elementAt(i).title),
                        ]),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
