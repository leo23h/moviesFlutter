import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/MovieModel.dart';
import 'dart:convert';

import 'package:movies_app/src/models/movieDetailModel.dart';

class MoviesProvider {
  var client = http.Client();
  final _apiKey = 'b7e1fcbbdac62f6147842f1122460107';

  Future<MoviesModel> fetchMovieList() async {
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MoviesModel> fetchMoviesTopRated() async {
    final response = await client.get("http://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MovieDetailModel> fetchMoviesDetail({@required int id}) async {
    final response = await client.get("http://api.themoviedb.org/3/movie/$id?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}