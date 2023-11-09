import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wweek16_api/models/DetailsModel.dart';
import 'package:http/http.dart' as http ;

class DetailsApi{
  Future <DetailsModel?> fetchDetails(int id) async {

      final http.Response response = await http.get(Uri.parse("https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=a766a2917db9482d9d18a75592ccf156&cuisine=egyptian"));
      if (response.statusCode>=200) {
        final Map<String , dynamic> jsonBody = jsonDecode(response.body);
        DetailsModel detailsModel = DetailsModel.fromJson(jsonBody);
        return detailsModel ;
      } else {
        debugPrint('status code = ${response.statusCode}');
        return null;
      }


  }
}