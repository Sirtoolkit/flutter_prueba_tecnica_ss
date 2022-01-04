import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/provider/repos_user_provider.dart';
import '/widgets/loading_widget.dart';
import '/widgets/card_widget.dart';
import '/provider/dark_mode_provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reposUserProvider = context.watch<ReposUserProvider>();
    final darkModeProvider = context.watch<DarkModeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_3),
            onPressed: () =>
                darkModeProvider.darkMode = !darkModeProvider.darkMode,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: reposUserProvider.searchController,
              style: TextStyle(
                color: darkModeProvider.darkMode
                    ? const Color(0xFFfafdf6)
                    : const Color(0xFF2B3137),
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Github Username',
              ),
            ),
            if (reposUserProvider.searchController.text.isNotEmpty)
              reposUserProvider.reposUser.isNotEmpty
                  ? Expanded(
                      child: Stack(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: reposUserProvider.scrollController,
                              itemCount: reposUserProvider.reposUser.length,
                              itemBuilder: (context, index) {
                                final reposUser =
                                    reposUserProvider.reposUser[index];
                                return CardWidget(
                                  image: reposUser.owner!.avatarUrl,
                                  title: reposUser.name,
                                  owner: reposUser.owner!.login,
                                  description:
                                      reposUser.private! ? 'Private' : 'Public',
                                );
                              },
                            ),
                          ),
                          reposUserProvider.isLoadingScroll
                              ? const Positioned(
                                  bottom: 8,
                                  left: 0,
                                  right: 0,
                                  child: LoadingWidget())
                              : Container(),
                        ],
                      ),
                    )
                  : const Expanded(child: LoadingWidget())
            else
              Expanded(
                child: Center(
                  child: Text(
                    '¡Enter Github Username!',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
