import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:test_application_4/network/PrefStore.dart';
import 'Constants.dart';

class HttpClient {
  Map<String, String> headers = {};

  Future<http.Response> postRequest(String api, Object params) async {
    final response =
        await http.post(Uri.parse(Constants.BASE_URL + api), body: params);
    testLog("\n===========\n" +
        Constants.BASE_URL +
        api +
        "\n*************\n" +
        params.toString() +
        "\n*************\n" +
        response.body);

    var responseBody = jsonDecode(response.body);
    var responseStatus = responseBody["status"];
    String stringStatus = responseStatus.toString();
    responseBody["status"] = stringStatus;
    String json = jsonEncode(responseBody);
    return http.Response(json, 123);
  }

  testLog(String msgData) {
    if (!kReleaseMode) log(msgData);
  }

  Future<http.Response> getRequest(String api) async {
    headers["Authentication"] = "Bearer ${(await getToken(PrefStore.TOKEN))!}";

    final response =
        await http.get(Uri.parse(Constants.BASE_URL + api), headers: headers);
    testLog("\n===========\n" +
        headers.toString() +
        "\n*************\n" +
        Constants.BASE_URL +
        api +
        "\n*************\n" +
        response.body);
    return response;
  }
}
