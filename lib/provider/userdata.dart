import 'dart:convert';
import 'package:clipper/constants/connectionStatus.dart';
import 'package:clipper/constants/constants.dart';
import 'package:clipper/provider/data.dart';
import 'package:flutter/material.dart';
import 'models/userdatamodel.dart';
import 'package:http/http.dart' as http;

class UserData with ChangeNotifier {
  UserData();

  bool _isFetching = false;
  bool _isLoading = false;
  bool _getuserDetails = false;

  UserDataModel userData = UserDataModel();
  UserDataPref userDataPref = UserDataPref();

  bool get isFetching =>
      _isFetching; // It is checking whether data is fetched from the server or not yet.

  bool get isLoading =>
      _isLoading; // It is checking whether more data is fetched from the server or not yet.

  bool get getuserDetails => _getuserDetails;

  ConnectionStatus _connection = ConnectionStatus.getInstance();

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
      // String users = await userDataPref.getUserData();
      // users = userData.toJson().toString();
      // userDataPref.setUserData(users);

      // print(userDataPref.getUserData().toString());
      // userData = UserDataModel.fromJson(userDataPref.getUserData());
    }
    return userData;
  }

  UserDataModel getResponseJson() => userData;
}
