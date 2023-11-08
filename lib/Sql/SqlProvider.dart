
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'SqlModel.dart';


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

  Future<List<SQLModel>> getAllRecepies() async {
    List<Map<String , dynamic >> foodmaps = await db.query(tableRecipes);
    if (foodmaps.isEmpty) {
      return [];
    }else {
      List<SQLModel> recipes = [];
      for ( var element in foodmaps){
        recipes.add(SQLModel.fromAPI(element));
      }
      return recipes;
    }
  }

  Future<SQLModel> insert(SQLModel sqlmodel) async {
    sqlmodel.id = await db.insert(tableRecipes, sqlmodel.toMap());
    return sqlmodel;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableRecipes, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SQLModel sqlmodel) async {
    return await db.update(tableRecipes, sqlmodel.toMap(),
        where: '$columnId = ?', whereArgs: [sqlmodel.id]);
  }

  Future close() async => db.close();

}