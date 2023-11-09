import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wweek16_api/models/RecipesModal.dart';


const String tableRecipes = 'tablerecipes';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnImage = 'image';

class FoodProvider {
  late Database db;
  static final FoodProvider instance = FoodProvider._internal();
  factory FoodProvider() {
    return instance;
  }
  FoodProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'food.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableRecipes ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnImage text not null)
''');
        });
  }

  Future<List<RecipesModels>> getAllRecipes() async {
    List<Map<String , dynamic >> foodMaps = await db.query(tableRecipes);
    if (foodMaps.isEmpty) {
      return [];
    }else {
      List<RecipesModels> recipes = [];
      for ( var element in foodMaps){
        recipes.add(RecipesModels.fromJson(element));
      }
      return recipes;
    }
  }

  Future<int?> insert(RecipesModels sqlModel) async {
    sqlModel.id = await db.insert(tableRecipes, sqlModel.toMap());
    return sqlModel.id;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableRecipes, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(RecipesModels sqlModel) async {
    return await db.update(tableRecipes, sqlModel.toMap(),
        where: '$columnId = ?', whereArgs: [sqlModel.id]);
  }

  Future close() async => db.close();

}