class RecipesModelsList{
  late final List<dynamic> recipes ;
  RecipesModelsList({required this.recipes});
  factory RecipesModelsList.fromJson(Map<String,dynamic> jsonData){
    return RecipesModelsList(
        recipes: jsonData['results']);
  }
}