import 'package:flutter/material.dart';
import 'package:wweek16_api/Sql/SqlProvider.dart';
import 'package:wweek16_api/models/RecipesModal.dart';
import 'package:wweek16_api/views/DetailsHome.dart';
import '../ApI/RecipesApi.dart';
import 'Fav.dart';

class RecipesHome extends StatefulWidget {
  const RecipesHome({super.key});
  @override
  State<RecipesHome> createState() => _RecipesHomeState();
}

class _RecipesHomeState extends State<RecipesHome> {
  RecipesApi api1 = RecipesApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Recipes",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FavHome()));
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              )),
          const Icon(Icons.play_arrow_outlined, color: Colors.black),
          const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          const Icon(Icons.share, color: Colors.black),
        ],
      ),
      body: FutureBuilder<List<RecipesModels>?>(
        //The data from where ?
        future: api1.fetchRecipes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsHome(id: snapshot.data[i].id)));
                      },
                      child: Card(
                        child: Column(children: [
                          Image.network(snapshot.data[i].image),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("${snapshot.data[i].title}",
                                      textAlign: TextAlign.center),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await FoodProvider.instance
                                          .insert(snapshot.data[i]);
                                     int ? id = await  FoodProvider.instance
                                         .insert(snapshot.data[i]);
                                      debugPrint(id.toString() );
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
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
