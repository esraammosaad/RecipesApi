
/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ApI/RecipesApi.dart';
import '../Sql/SqlModel.dart';
import '../Sql/SqlProvider.dart';
import 'DetailsHome.dart';

class FavHome extends StatefulWidget {
  const FavHome({super.key});

  @override
  State<FavHome> createState() => _RecipesHomeState();
}

class _RecipesHomeState extends State<FavHome> {
  List <SQLModel> recipes = [];
  RecipesApi api1 = RecipesApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Recipes",style: TextStyle(fontSize: 30,color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              // FoodProvider.instance.insert(SQLModel(id: ,title: title, image: image))
            });
          }, icon: Icon(Icons.favorite_border)),
          Icon(Icons.play_arrow_outlined),
          Icon(Icons.shopping_cart_outlined),
          Icon(Icons.share),
        ],
      ),
      body: FutureBuilder<List<SQLModel>?>(
        //The data from where ?
        future: FoodProvider.instance.getAllRecepies(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Card(
              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
                  itemBuilder: (context,i){
                    return GestureDetector(
                      child: Card(
                        child: Column(children: [
                          Image.network(recipes.elementAt(i).image),
                          Text("${recipes.elementAt(i).title}"),
                        ]),
                      ),);
                  }),
            );
          }
          else if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator(),);
        }


        ,)

      ,
    );
  }
}*/