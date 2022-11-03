class User {
  String? name;
  String? email;
  int id = 0;

  User.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {'name': name};
}
