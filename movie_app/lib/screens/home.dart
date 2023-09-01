import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/widgets/movie_list_item.dart';

import 'movie_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Movie> movies = Movie.movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
            clipper: _CustomeClipper(),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 21, 76, 110),
              child: Center(
                  child: Text(
                "Explore",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white),
              )),
            )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                  TextSpan(
                      text: "Featured ",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Movies",
                      style: TextStyle(color: Colors.grey[500])),
                ])),
            SizedBox(
              height: 20.0,
            ),
            for (final movie in movies)
              InkWell(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> MovieScreen(movie: movie,)));
                },
                child: MovieListItem(
                  imageUrl: movie.imagePath,
                  name: movie.name,
                  information:
                      '${movie.year} | ${movie.category} | ${movie.duration.inHours}h | ${movie.duration.inMinutes.remainder(60)}m',
                ),
              ),
          ],
        ),
      )),
    );
  }
}

class _CustomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
