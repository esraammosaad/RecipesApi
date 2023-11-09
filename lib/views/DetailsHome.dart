import 'package:flutter/material.dart';
import 'package:wweek16_api/models/DetailsModel.dart';
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
        leading:  IconButton(icon:const Icon(Icons.arrow_back_ios_new_rounded),color: Colors.black,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Details",style: TextStyle(fontSize: 30,color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.favorite_border)),
          const Icon(Icons.play_arrow_outlined),
          const Icon(Icons.shopping_cart_outlined),
          const Icon(Icons.share),
        ],
      ),
      body: FutureBuilder<DetailsModel?>(
        //The data from where ?widget.id
        future: api2.fetchDetails(widget.id!),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
           // response = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(children: [
                        GestureDetector(child: Image.network(snapshot.data.image)),
                        Text("${snapshot.data.title}"),
                        Text("${snapshot.data.readyInMinutes}"),
                        Text("${snapshot.data.summary}"),
                      ]),
                    );


          }
          else if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator(),);
        }
        ,)
      ,
    );
  }
}
