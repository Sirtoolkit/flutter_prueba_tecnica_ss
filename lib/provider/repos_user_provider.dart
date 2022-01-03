import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica_ss/models/repository_model.dart';

import '/screens/details_screen.dart';
import '/utils/navigation_services.dart';

import '/models/repos_user_model.dart';
import '/services/repos_user_services.dart';
import '/config/get_it_config.dart';

class ReposUserProvider with ChangeNotifier {
  final _reposUserServices = locator.get<ReposUserServices>();

  late List<ReposUserModel> _reposUser;
  late RepositoryModel _repositoryModel;
  late bool _isLoading;
  late TextEditingController _searchController;
  late Timer _debounce;
  late String _searchText;

  List<ReposUserModel> get reposUser => _reposUser;

  RepositoryModel get repositoryModel => _repositoryModel;

  TextEditingController get searchController => _searchController;

  bool get isLoading => _isLoading;

  ReposUserProvider() {
    _reposUser = [];
    _searchController = TextEditingController();
    _searchText = '';
    _isLoading = false;
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

  void getRepository(String owner, String repository) async {
    _isLoading = true;
    notifyListeners();

    _repositoryModel =
        (await _reposUserServices.getRepository(owner, repository))!;

    _isLoading = false;
    notifyListeners();
  }

  navigateToReposUser(Map mapRepo) {
    locator<NavigationServices>().navigateTo(DetailsScreen.routeName, mapRepo);
    notifyListeners();
  }
}
