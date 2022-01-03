import 'dart:convert';
import 'package:flutter_prueba_tecnica_ss/models/repository_model.dart';
import 'package:http/http.dart' as http;

import '/constants/github_api_constants.dart';
import '/models/repos_user_model.dart';

class ReposUserServices {
  Future<List<ReposUserModel>> getUserRepos(String user) async {
    final path = Uri.https(apiURL, '/users/$user/repos');

    final response = await http.get(path, headers: {
      'Accept': 'application/vnd.github.v3+json',
      'Authorization': 'token $token',
    });
print(response.body);
    if (!(response.statusCode == 200)) {
      return [];
    }

    return json
        .decode(response.body)
        .map<ReposUserModel>((repo) => ReposUserModel.fromJson(repo))
        .toList();
  }

  Future<RepositoryModel?> getRepository(String owner, String repo) async {
    final path = Uri.https(apiURL, '/repos/$owner/$repo');

    final response = await http.get(path, headers: {
      'Accept': 'application/vnd.github.v3+json',
      'Authorization': 'token $token',
    });

    if (!(response.statusCode == 200)) {
      return null;
    }

    return RepositoryModel.fromJson(json.decode(response.body));
  }
}
