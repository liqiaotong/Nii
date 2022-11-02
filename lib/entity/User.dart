class User {
  late String name;
  late int id;

  User.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {'name': name};
}
