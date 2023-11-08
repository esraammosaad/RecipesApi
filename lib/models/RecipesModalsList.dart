class RecipesModelsList{
  late final List<dynamic> recipes ;
  RecipesModelsList({required this.recipes});
  factory RecipesModelsList.fromjson(Map<String,dynamic> jsonData){
    return RecipesModelsList(
        recipes: jsonData['results']);
  }
}