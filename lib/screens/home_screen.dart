import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/provider/repos_user_provider.dart';
import '/widgets/loading_widget.dart';
import '/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reposUserProvider = context.watch<ReposUserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_3),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: reposUserProvider.searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Github Username',
              ),
            ),
            if (reposUserProvider.searchController.text.isNotEmpty)
              reposUserProvider.reposUser.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: reposUserProvider.reposUser.length,
                        itemBuilder: (context, index) {
                          final reposUser = reposUserProvider.reposUser[index];
                          return CardWidget(
                            image: reposUser.owner!.avatarUrl,
                            title: reposUser.name,
                            owner: reposUser.owner!.login,
                            description:
                                reposUser.private! ? 'Private' : 'Public',
                          );
                        },
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
