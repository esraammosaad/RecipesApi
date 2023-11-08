class RecipesModels {
   int? id;
  String? title ;
 String? image ;
  RecipesModels({this.id, this.title, this.image});

  factory RecipesModels.fromjoson(Map<String,dynamic> jsonData){
    return RecipesModels(
        id: jsonData['id'],
        title:jsonData['title'],
        image: jsonData['image']);
  }
}