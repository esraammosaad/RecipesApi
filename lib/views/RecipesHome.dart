import 'package:flutter/material.dart';
import 'package:wweek16_api/Sql/SqlModel.dart';
import 'package:wweek16_api/models/RecipesModal.dart';
import 'package:wweek16_api/views/DetailsHome.dart';

import '../ApI/RecipesApi.dart';
import '../Sql/SqlProvider.dart';
import '../models/DetailsModel.dart';
/*class RecipesHome extends StatefulWidget {
  const RecipesHome({super.key});

  @override
  State<RecipesHome> createState() => _RecipesHomeState();
}

class _RecipesHomeState extends State<RecipesHome> {
  List sqlmodel = [];
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
                     onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsHome(id: snapshot.data![i].id)));
                      });
                     },

                      child: Card(
                      child: Column(children: [
                        Image.network(snapshot.data[i].image),
                        Text("${snapshot.data[i].title}"),
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
class RecipesHome extends StatefulWidget {
  const  RecipesHome({super.key});
  @override
  State< RecipesHome> createState() => _RecipesHomeState();
}
class _RecipesHomeState extends State< RecipesHome> {
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
            });
          }, icon: Icon(Icons.favorite_border)),
          Icon(Icons.play_arrow_outlined),
          Icon(Icons.shopping_cart_outlined),
          Icon(Icons.share),
        ],
      ),
      body: FutureBuilder<List<RecipesModels>?>(
        //The data from where ?
        future: api1.fetchRecipes(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Card(
              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
                  itemBuilder: (context,i){
                    return GestureDetector(
                      onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsHome(id: snapshot.data[i].id)));
                      setState(() {
                      });
                      },
                      child: Card(
                        child: Column(children: [
                          Image.network(snapshot.data[i].image),
                          Text("${snapshot.data[i].title}"),
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
}

