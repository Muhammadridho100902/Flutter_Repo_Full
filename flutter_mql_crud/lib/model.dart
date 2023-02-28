class Employee {
  int id;
  String first_name;
  String last_name;

  Employee(
      {required this.id, required this.first_name, required this.last_name});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }
}
