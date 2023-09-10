import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';


class ApiHelper{

  static List movies = [];
  static List moviesInApp = [];
  static Future<List<MovieModel>> getMovies () async{
    List<MovieModel> movies=[];
  var url='https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=9813ce01a72ca1bd2ae25f091898b1c7';
  var response =await http.get(Uri.parse(url));
  if(response.statusCode==200){
    var responseBody=jsonDecode(response.body);
    for (var element in responseBody['results']) {
      movies.add(MovieModel.fromJson(element));
    }
  }
  return movies ;

  }

}