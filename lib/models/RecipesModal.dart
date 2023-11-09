class RecipesModels {
  int? id;
  String? title;
  String? image;
  RecipesModels({this.id, this.title, this.image});

  factory RecipesModels.fromJson(Map<String, dynamic> jsonData) {
    return RecipesModels(
        id: jsonData['id'], title: jsonData['title'], image: jsonData['image']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {};
    if (json['id'] != null) json['id'] = id;
    json['title'] = title;
    json['image'] = image;
    return json;
  }
}
