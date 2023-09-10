import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/widgets/movie_list_item.dart';
import '../models/service.dart';
import 'movie_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    ApiHelper.getMovies().then((value) {
      setState(() {
        ApiHelper.movies.addAll(value);
        movies = ApiHelper.movies;
        isLoading = false;
      });
    });
    super.initState();
  }

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
              color: const Color.fromARGB(255, 8, 35, 81),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Color.fromARGB(255, 8, 35, 81),
            ))
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: movies.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieScreen(
                                        movie: movies[index],
                                      )));
                        },
                        child: MovieListItem(
                          imageUrl: (imgUrl + movies[index].posterPath),
                          name: movies[index].title,
                          information: movies[index].releaseDate,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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
