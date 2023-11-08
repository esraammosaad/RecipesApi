import 'dart:convert';

import 'package:wweek16_api/models/DetailsModel.dart';

import 'package:http/http.dart' as http ;

import '../models/RecipesModalsList.dart';
class DetailsApi{
  Future <DetailsModel?> fetchDetails(int id) async {

      final http.Response response = await http.get(Uri.parse("https://api.spoonacular.com/recipes/716429/information?includeNutrition=false&apiKey=a766a2917db9482d9d18a75592ccf156&cuisine=egyptian"));
      if (response.statusCode>=200) {
        final Map<String , dynamic> jsonbody = jsonDecode(response.body);
        DetailsModel detailsModel = DetailsModel.fromjson(jsonbody);
        return detailsModel ;
      } else {
        print('status code = ${response.statusCode}');}

  }
}