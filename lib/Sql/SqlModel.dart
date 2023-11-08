class SQLModel {
  int? id;
  late String title;
  late String image;

  SQLModel({
     this.id,
    required this.title,
    required this.image,
  });

  SQLModel.fromAPI(Map<String , dynamic> json){
    if (id != null)id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map <String , dynamic> toMap(){
    Map <String , dynamic> json = {};
    if (json['id'] != null)json['id'] = id;
    json['title'] = title;
    json['image'] = image;
    return json;
  }
}
