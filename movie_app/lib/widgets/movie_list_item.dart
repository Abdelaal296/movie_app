import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final GlobalKey backgroundImageKey = GlobalKey();

  MovieListItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.information});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              key: backgroundImageKey,
              width: double.infinity,
            ),
            Positioned.fill(
                child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 0.95],
              )),
            )),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    information,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
