import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/models/repos_user_model.dart';
import '/services/repos_user_services.dart';
import '/config/get_it_config.dart';

class ReposUserProvider with ChangeNotifier {
  late List<ReposUserModel> _reposUser;
  late TextEditingController _searchController;

  final _reposUserServices = locator.get<ReposUserServices>();

  late Timer _debounce;
  late String _searchText;

  List<ReposUserModel> get reposUser => _reposUser;

  TextEditingController get searchController => _searchController;

  ReposUserProvider() {
    _reposUser = [];
    _searchController = TextEditingController();
    _searchText = '';
    _debounce = Timer(const Duration(milliseconds: 0), () {});
    _searchController.addListener(() {
      getReposUser();
    });
  }

  void getReposUser() async {
    if (_debounce.isActive) _debounce.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (_searchText != searchController.text) {
        _reposUser =
            await _reposUserServices.getUserRepos(searchController.text);
        _searchText = searchController.text;
        notifyListeners();
      }
    });
  }
}
