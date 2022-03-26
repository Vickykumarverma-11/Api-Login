import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_application_4/network/HttpClient.dart';

import '../model/Projects.dart';
import '../network/Constants.dart';

class ProjectsProvider extends ChangeNotifier {
  HttpClient client = HttpClient();
  Projects? _projects;

  Projects? get projects => _projects;

  set projects(Projects? value) {
    _projects = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  fetchProjects(String token) {
    isLoading = true;
    getProjects(token).then((result) {
      isLoading = false;
      projects = result;
    });
  }

  Future<Projects> getProjects(String token) async {
    final response = await client.getRequest(Constants.FETCH_PROJECTS_API);
    Projects result = Projects.fromJson(jsonDecode(response.body));
    return result;
  }
}
