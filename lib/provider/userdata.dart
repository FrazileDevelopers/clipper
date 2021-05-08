import 'dart:convert';
import 'package:clipper/constants/connectionStatus.dart';
import 'package:clipper/constants/constants.dart';
import 'package:clipper/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'hivedb/usermodel.dart';
import 'models/userdatamodel.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class UserData with ChangeNotifier {
  UserData();

  bool _isFetching = false;
  bool _isLoading = false;
  bool _getuserDetails = false;
  Box<Person> usersBox;

  UserDataModel userData = UserDataModel();
  Random rnd = Random();

  bool get isFetching =>
      _isFetching; // It is checking whether data is fetched from the server or not yet.

  bool get isLoading =>
      _isLoading; // It is checking whether more data is fetched from the server or not yet.

  bool get getuserDetails => _getuserDetails;

  ConnectionStatus _connection = ConnectionStatus.getInstance();

  initializeDB() {
    usersBox = Hive.box<Person>(Constants.hiveBox);
    notifyListeners();
  }

  Future<UserDataModel> userdata() async {
    String jsonResponse = '';
    _isLoading = true;
    notifyListeners();
    await _connection.checkConnection();

    if (_connection.hasConnection) {
      var url = Uri.parse('https://api.agify.io/?name=' + Constants.getname);
      // print(url);
      var response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        jsonResponse = response.body;
      } else {
        jsonResponse = response.body;
      }
    }
    // print('Response =============>' + jsonResponse);
    _isLoading = false;
    _getuserDetails = true;
    notifyListeners();

    if (jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(jsonResponse);
      userData = UserDataModel.fromJson(json);
      var person = Person(
        name: userData.name.toString(),
        age: userData.age.toString(),
        count: userData.count.toString(),
        profilepic: images[rnd.nextInt(
          images.length,
        )],
      );
      await usersBox.put(Constants.getname, person);
      notifyListeners();
      // usersBox.put('name', userData.name.toString());
      // usersBox.put('age', userData.age.toString());
      // usersBox.put('count', userData.count.toString());
    }
    return userData;
  }

  UserDataModel getResponseJson() => userData;
}
