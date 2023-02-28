class HomeFood {
  final String id;
  final String name;
  final String category;
  final String region;
  final String image;

  HomeFood(this.id, this.name, this.category, this.region, this.image);

  factory HomeFood.fromJson(Map<String, dynamic> json){
    return HomeFood(json['idMeal'], json['strMeal'], json['strCategory'], json['strArea'], json['strMealthumb']);
  }
}
