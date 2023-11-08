import 'package:flutter/material.dart';
import 'package:wweek16_api/Sql/SqlModel.dart';
import 'package:wweek16_api/Sql/SqlProvider.dart';
import 'package:wweek16_api/models/DetailsModel.dart';
import 'package:wweek16_api/views/Fav.dart';
import '../ApI/DetailsApi.dart';


class DetailsHome extends StatefulWidget {
    const DetailsHome({super.key,required this.id});
     final int? id ;

  @override
  State<DetailsHome> createState() => _RecipesHomeState();
}

class _RecipesHomeState extends State<DetailsHome> {
 // late DetailsModel response;
  DetailsApi api2 = DetailsApi();
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
           //  FoodProvider.instance.insert(SQLModel(title: response.title, image: response.image));
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>FavHome()));

            });
          }, icon: Icon(Icons.favorite_border)),
          Icon(Icons.play_arrow_outlined),
          Icon(Icons.shopping_cart_outlined),
          Icon(Icons.share),
        ],
      ),
      body: FutureBuilder<DetailsModel?>(
        //The data from where ?widget.id
        future: api2.fetchDetails(widget.id!),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
           // response = snapshot.data!;
                    return SingleChildScrollView(
                      child: Container(
                              child: Column(children: [
                                GestureDetector(child: Image.network(snapshot.data.image)),
                                Text("${snapshot.data.title}"),
                                Text("${snapshot.data.readyInMinutes}"),
                                Text("${snapshot.data.summary}"),
                              ]),

            ),
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
