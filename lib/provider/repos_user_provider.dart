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
  late bool _isLoadingScroll;

  late TextEditingController _searchController;
  late ScrollController _scrollController;

  late Timer _debounce;
  late String _searchText;

  late int _page;
  late int _limit;

  RepositoryModel get repositoryModel => _repositoryModel;

  TextEditingController get searchController => _searchController;

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading;

  bool get isLoadingScroll => _isLoadingScroll;

  List<ReposUserModel> get reposUser => _reposUser.take(_limit).toList();

  ReposUserProvider() {
    _reposUser = [];
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _searchText = '';
    _isLoadingScroll = false;
    _isLoading = false;
    _debounce = Timer(const Duration(milliseconds: 0), () {});
    _page = 1;
    _limit = 10;
    _searchController.addListener(() {
      getReposUser();
    });

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (_isLoadingScroll) return;

    _isLoadingScroll = true;
    notifyListeners();

    _page++;
    _limit += 10;
    _reposUser = await _reposUserServices.getUserRepos(_searchText, _page);

    _isLoadingScroll = false;
    notifyListeners();

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void getReposUser() async {
    if (_debounce.isActive) _debounce.cancel();

    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (_searchText != searchController.text) {
        _reposUser =
            await _reposUserServices.getUserRepos(searchController.text, _page);
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
