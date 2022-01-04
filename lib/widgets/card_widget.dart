import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/repos_user_provider.dart';

class CardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? owner;
  final String? description;

  const CardWidget(
      {Key? key, this.title, this.description, this.image, this.owner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reposUserProvider = context.watch<ReposUserProvider>();

    final size = MediaQuery.of(context).size;
    final sizeWith = size.width * 0.16;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: 'assets/img/loading.gif',
              image: image!,
              width: sizeWith,
              height: sizeWith,
            ),
          ),
          title: Text(title!, style: Theme.of(context).textTheme.bodyText1),
          subtitle:
              Text(description!, style: Theme.of(context).textTheme.bodyText2),
          onTap: () => reposUserProvider
              .navigateToReposUser({'owner': owner, 'repository': title}),
        ),
      ),
    );
  }
}
