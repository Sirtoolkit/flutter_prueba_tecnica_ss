import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '/provider/repos_user_provider.dart';
import '/widgets/loading_widget.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapRepo = ModalRoute.of(context)?.settings.arguments as Map;
    final reposUserProvider = context.watch<ReposUserProvider>();
    final textTheme = Theme.of(context).textTheme;

    reposUserProvider.getRepository(mapRepo['owner'], mapRepo['repository']);

    return Scaffold(
      appBar: AppBar(
        title: Text(mapRepo['repository']),
      ),
      body: reposUserProvider.isLoading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/img/loading.gif'),
                            image: NetworkImage(reposUserProvider
                                .repositoryModel.owner!.avatarUrl!),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reposUserProvider.repositoryModel.owner!.login!,
                              style:
                                  textTheme.bodyText1!.copyWith(fontSize: 32.0),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              reposUserProvider.repositoryModel.owner!.type!,
                              style: textTheme.bodyText2!
                                  .copyWith(color: Colors.blueGrey),
                            ),
                            const SizedBox(height: 16),
                            Text('Ir a la página de GitHub',
                                style: textTheme.bodyText1),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () async {
                                if (!await launch(reposUserProvider.repositoryModel.url!)) throw 'Could not launch ${reposUserProvider.repositoryModel.url}';  },
                              child: Text(
                                reposUserProvider.repositoryModel.owner!.url!,
                                style: textTheme.bodyText1!
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text('Repositorio', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(reposUserProvider.repositoryModel.name!,
                      style: textTheme.bodyText2),
                  const SizedBox(height: 16),
                  Text('Descripción', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(
                      reposUserProvider.repositoryModel.description == null
                          ? 'Sin descripción'
                          : reposUserProvider.repositoryModel.description!,
                      style: textTheme.bodyText2),
                  const SizedBox(height: 16),
                  Text('Lenguaje', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(reposUserProvider.repositoryModel.language!,
                      style: textTheme.bodyText2),
                  const SizedBox(height: 16),
                  Text('Creado', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(reposUserProvider.repositoryModel.createdAt!,
                      style: textTheme.bodyText2),
                  const SizedBox(height: 16),
                  Text('Actualizado', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(reposUserProvider.repositoryModel.updatedAt!,
                      style: textTheme.bodyText2),
                  const SizedBox(height: 16),
                  Text('Público', style: textTheme.bodyText1),
                  const SizedBox(height: 4),
                  Text(reposUserProvider.repositoryModel.private! ? 'No' : 'Sí',
                      style: textTheme.bodyText2),
                ],
              ),
            )
          : const LoadingWidget(),
    );
  }
}
