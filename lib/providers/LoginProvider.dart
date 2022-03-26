import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_application_4/network/Constants.dart';
import 'package:test_application_4/network/PrefStore.dart';
import 'package:test_application_4/screens/Homepage.dart';

import '../model/Login.dart';

import '../network/HttpClient.dart';

class LoginProvider extends ChangeNotifier {
  HttpClient client = HttpClient();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  loginUser(BuildContext context, String userName, String password) {
    isLoading = true;
    login(userName, password).then((result) {
      isLoading = false;
      if (result.sessionToken == null)
        showAlert(context, result.detail ?? "", (bool) => {});
      else {
        saveToken(PrefStore.TOKEN, result.sessionToken);
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
    });
  }

  Future<Login> login(String userName, String password) async {
    var param = Map<String, String>();

    param["username"] = userName;
    param["passcode"] = password;

    final response =
        await client.postRequest(Constants.LOGIN_API, json.encode(param));
    Login result = Login.fromJson(jsonDecode(response.body));
    return result;
  }

  showAlert(BuildContext _context, String message, callBack(bool),
      {title = "Alert"}) {
    showDialog(
        context: _context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    callBack(true);
                  },
                ),
              ],
            ));
  }
}
