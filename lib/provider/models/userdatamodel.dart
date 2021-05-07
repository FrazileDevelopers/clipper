class UserDataModel {
  UserDataModel({
    this.name,
    this.age,
    this.count,
  });

  final String name;
  final int age;
  final int count;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "count": count == null ? null : count,
      };
}
