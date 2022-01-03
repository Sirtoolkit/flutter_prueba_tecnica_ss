import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;

  const CardWidget({Key? key, this.title, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWith = size.width * 0.16;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5,
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
          title: Text(title!,style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(description!),
        ),
      ),
    );
  }
}
