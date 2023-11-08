import 'dart:convert';

import 'package:wweek16_api/models/RecipesModal.dart';
import 'package:http/http.dart' as http ;

import '../models/RecipesModalsList.dart';
class RecipesApi{
  Future <List<RecipesModels>?> fetchRecipes() async {
 try{
   final http.Response response = await http.get(Uri.parse("https://api.spoonacular.com/recipes/complexSearch?query=pasta&number=15&apiKey=a766a2917db9482d9d18a75592ccf156&cuisine=egyptian"));
   if (response.statusCode>=200) {
     String data = response.body;
     var jsonData= jsonDecode(data);
     RecipesModelsList recips = RecipesModelsList.fromjson(jsonData);
    List<RecipesModels> recipeslist = recips.recipes.map((e)=>RecipesModels.fromjoson(e)).toList();
   return recipeslist;
   } else {
    print('status code = ${response.statusCode}');}
 }
 catch (ex) {
    print(ex);
  }
}
}