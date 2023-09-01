import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/screens/movie_player.dart';


class MovieScreen extends StatelessWidget {
  final Movie movie;
  MovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Color.fromARGB(255, 8, 35, 81),
          ),
          Image.network(
            movie.imagePath,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
              child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color.fromARGB(255, 8, 35, 81),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            )),
          )),
          Positioned(
            bottom: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    movie.name,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${movie.year} | ${movie.category} | ${movie.duration.inHours}h | ${movie.duration.inMinutes.remainder(60)}m',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
                    unratedColor: Colors.white,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.5),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.45, color: Colors.white),
                    maxLines: 8,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    primary: Colors.red[600],
                    fixedSize: Size(MediaQuery.of(context).size.width*0.425, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),

                  ),
                  
                    onPressed: () {},
                    child: Text(
                      'Add to Watchlist',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    )),
                    SizedBox(width: 10,),
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    primary: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width*0.425, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),

                  ),
                  
                    onPressed: () {
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: ((context) => MoviePlayer(movie: movie,)))
                      );
                    },
                    child: Text(
                      'Start Watching',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black),
                    ))
            ],
          ),
              ))
        ],
      ),
    );
  }
}



