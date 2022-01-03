import 'dart:convert';
import 'package:http/http.dart' as http;

import '/constants/github_api_constants.dart';
import '/models/repos_user_model.dart';

class ReposUserServices {
  Future<List<ReposUserModel>> getUserRepos(String user) async {
    final path = Uri.https(apiURL, '/users/$user/repos');

    final response = await http
        .get(path, headers: {'Accept': 'application/vnd.github.v3+json'});

    if (!(response.statusCode == 200)) {
      return [];
    }

    return json
        .decode(response.body)
        .map<ReposUserModel>((repo) => ReposUserModel.fromJson(repo))
        .toList();
  }
}
