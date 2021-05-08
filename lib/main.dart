import 'dart:io';

import 'package:clipper/constants/constants.dart';
import 'package:clipper/provider/hivedb/usermodel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'pages/config/config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(PersonAdapter());
  await Hive.openBox<Person>(Constants.hiveBox);
  runApp(ConfigApp());
}
