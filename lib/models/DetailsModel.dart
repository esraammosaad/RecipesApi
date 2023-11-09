class DetailsModel {
  late String title;
  late int readyInMinutes;
  late String image;
  late String summary;

  DetailsModel({
    required this.title,
    required this.readyInMinutes,
    required this.image,
    required this.summary
  });

  DetailsModel.fromJson(Map<String,dynamic> map){
    title = map['title'];
    readyInMinutes = map['readyInMinutes'];
    image = map['image'];
    summary = map['summary'];
  }

  Map<String,dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['title'] = title;
    map['readyInMinutes'] = readyInMinutes;
    map['image']= image;
    map['summary']= summary;
    return map;
  }
}
