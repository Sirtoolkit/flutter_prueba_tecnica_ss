import 'dart:convert';
import 'package:http/http.dart' as http;

import '/constants/github_api_constants.dart';
import '/models/repos_user_model.dart';

class ReposUserServices {
  // Function: getUserRepos
  // Description: Get user repos
  // Parameters:
  //  - user: String
  //  - page: int
  //  - perPage: int
  // Return: Future<List<Repo>>
   Future<List<ReposUserModel>> getUserRepos(String user, int page, int perPage) async {
    final path=Uri.https(apiURL, '/users/$user/repos?page=$page&per_page=$perPage');

    final response = await http.get(path, headers: {'Accept': 'application/vnd.github.v3+json'});

    if (!(response.statusCode == 200)) {
       return [];
    }

    final repos = json.decode(response.body);

    return repos.map<ReposUserModel>((repo) => ReposUserModel.fromJson(repo)).toList();
  }

}
