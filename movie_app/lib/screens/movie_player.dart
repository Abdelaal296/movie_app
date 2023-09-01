import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  final Movie movie;
  const MoviePlayer({super.key, required this.movie});

  @override
  State<MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset('assets/videos/Better.Call.Saul.mp4')
      ..initialize().then((value) {
        setState(() {
        });
      });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: Chewie(controller: chewieController,)),
    );
  }
}
