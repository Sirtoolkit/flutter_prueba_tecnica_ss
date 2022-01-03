import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica_ss/provider/repos_user_provider.dart';
import 'package:flutter_prueba_tecnica_ss/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapRepo = ModalRoute.of(context)?.settings.arguments as Map;
    final reposUserProvider = context.watch<ReposUserProvider>();

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
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/img/loading.gif'),
                            image: NetworkImage(reposUserProvider
                                .repositoryModel.owner!.avatarUrl!),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reposUserProvider.repositoryModel.owner!.login!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                reposUserProvider.repositoryModel.owner!.type!,
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Ir a la página de GitHub',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                reposUserProvider.repositoryModel.owner!.url!,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Repositorio',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.name!),
                    const SizedBox(height: 16),
                    const Text(
                      'Descripción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.description == null
                        ? 'Sin descripción'
                        : reposUserProvider.repositoryModel.description!),
                    const SizedBox(height: 16),
                    const Text(
                      'Lenguaje',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.language!),
                    const SizedBox(height: 16),
                    const Text(
                      'Creado',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.createdAt!),
                    const SizedBox(height: 16),
                    const Text(
                      'Actualizado',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.updatedAt!),
                    const SizedBox(height: 16),
                    const Text(
                      'Público',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(reposUserProvider.repositoryModel.private!
                        ? 'No'
                        : 'Sí'),
                  ],
                ),
              )
            : const LoadingWidget());
  }
}
