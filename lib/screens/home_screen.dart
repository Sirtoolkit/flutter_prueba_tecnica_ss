import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/provider/repos_user_provider.dart';
import '/widgets/loading_widget.dart';
import '/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reposUserProvider = context.watch<ReposUserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: reposUserProvider.searchController,
              decoration: const InputDecoration(
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
                            description:
                                reposUser.private! ? 'Private' : 'Public',
                          );
                        },
                      ),
                    )
                  : const Expanded(child: LoadingWidget())
            else
              const Expanded(
                child: Center(
                  child: Text(
                    'Enter Github Username',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
