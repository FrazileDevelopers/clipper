import 'dart:convert';
import 'package:clipper/constants/connectionStatus.dart';
import 'package:clipper/constants/constants.dart';
import 'package:flutter/material.dart';
import 'models/userdatamodel.dart';
import 'package:http/http.dart' as http;

class UserData with ChangeNotifier {
  UserData();

  bool _isFetching = false;
  bool _isLoading = false;

  UserDataModel userData = UserDataModel();

  bool get isFetching =>
      _isFetching; // It is checking whether data is fetched from the server or not yet.

  bool get isLoading =>
      _isLoading; // It is checking whether more data is fetched from the server or not yet.

  ConnectionStatus _connection = ConnectionStatus.getInstance();

  Future<UserDataModel> userdata() async {
    String jsonResponse = '';
    _isLoading = true;
    notifyListeners();
    await _connection.checkConnection();

    if (_connection.hasConnection) {
      var url = Uri.parse('https://api.agify.io/?name=' + Constants.getname);
      var response = await http.post(
        url,
      );
      if (response.statusCode == 200) {
        jsonResponse = response.body;
      } else {
        jsonResponse = response.body;
      }
    }
    _isLoading = false;
    notifyListeners();

    if (jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(jsonResponse);
      userData = UserDataModel.fromJson(json);
    }
    return userData;
  }

  UserDataModel getResponseJson() => userData;
}
