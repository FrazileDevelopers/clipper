import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'usermodel.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({
    @required this.name,
    @required this.age,
    @required this.count,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String count;

  // @override
  // Widget user() {
  //   return
  //   ;
  // }
}
