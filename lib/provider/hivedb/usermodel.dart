import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'usermodel.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({
    @required this.name,
    @required this.age,
    @required this.count,
    @required this.profilepic,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String count;

  @HiveField(3)
  String profilepic;

  // @override
  // Widget user() {
  //   return
  //   ;
  // }
}
