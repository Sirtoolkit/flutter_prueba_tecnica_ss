import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(title['repository']),
      ),
      body: Center(
        child: Text(title['owner']),
      ),
    );
  }
}
