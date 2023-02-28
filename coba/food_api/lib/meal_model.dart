import 'dart:convert';
import 'package:http/http.dart' as http;

class Meal{
  String id;
  String name;
  String pict;
  Meal({required this.id,required this.name,required this.pict});

  factory Meal.createMeal(Map<String, dynamic> object){
    return Meal(
      id: object['idMeal'].toString(),
      name: object['strMeal'],
      pict: object['strMealThumb']
    );
  }

  static Future<List<Meal>> getMeal(String kind) async{
    String api= "https://www.themealdb.com/api/json/v1/1/filter.php?c=$kind";
    var result = await http.get(Uri.parse(api));
    var jsonResult=json.decode(result.body);
    List<dynamic> listMeal= (jsonResult as Map <String,dynamic>)['meals'];
    List<Meal> meals=[];

    for(int i=0; i < listMeal.length;i++){
      meals.add(Meal.createMeal(listMeal[i]));
    }
    return meals;
  }


}

class MealSearch{
  String id;
  String name;
  String pict;
  MealSearch({required this.id,required this.name,required this.pict});

  factory MealSearch.createMealSearch(Map<String, dynamic> object){
    return MealSearch(
        id: object['idMeal'].toString(),
        name: object['strMeal'],
        pict: object['strMealThumb']
    );
  }

  static Future<List<Meal>> getMeal(String query) async{
    String api="https://www.themealdb.com/api/json/v1/1/search.php?s=$query";
    var result = await http.get(Uri.parse(api));
    var jsonResult=json.decode(result.body);
    List<dynamic> listMeal= (jsonResult as Map <String,dynamic>)['meals'];
    List<Meal> meals=[];

    for(int i=0; i < listMeal.length;i++){
      meals.add(Meal.createMeal(listMeal[i]));
    }
    return meals;
  }


}

class MealDetail{
  String id;
  String name;
  String pict;
  String ingridient;
  MealDetail({required this.id,required this.name,required this.pict,required this.ingridient});

  factory MealDetail.createMealDetail(Map<String, dynamic> object){
    return MealDetail(
        id: object['idMeal'].toString(),
        name: object['strMeal'],
        pict: object['strMealThumb'],
      ingridient: object['strIngredient1']+"\n"+object['strIngredient2']+"\n"+object['strIngredient3']+"\n"+object['strIngredient4']+"\n"+object['strIngredient5']+"\n"+object['strIngredient6']
    );
  }

  static Future<List<MealDetail>> getMealDetail(String id) async{
    String api="https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";
    var result = await http.get(Uri.parse(api));
    var jsonResult=json.decode(result.body);
    List<dynamic> listMeal= (jsonResult as Map <String,dynamic>)['meals'];
    List<MealDetail> meals=[];

    meals.add(MealDetail.createMealDetail(listMeal[0]));

    return meals;
  }
}