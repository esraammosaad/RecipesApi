import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wweek16_api/models/RecipesModal.dart';
import 'package:http/http.dart' as http;

import '../models/RecipesModalsList.dart';

class RecipesApi {
  Future<List<RecipesModels>?> fetchRecipes() async {
    try {
      final http.Response response = await http.get(Uri.parse(
          "https://api.spoonacular.com/recipes/complexSearch?query=pasta&number=15&apiKey=a766a2917db9482d9d18a75592ccf156&cuisine=egyptian"));
      if (response.statusCode >= 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        RecipesModelsList recipes = RecipesModelsList.fromJson(jsonData);
        List<RecipesModels> recipesList =
            recipes.recipes.map((e) => RecipesModels.fromJson(e)).toList();
        return recipesList;
      } else {
        debugPrint('status code = ${response.statusCode}');

      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
    return null;
  }
}
