import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/src/models/MovieModel.dart';
import 'package:movies_app/src/models/movieDetailModel.dart';
import 'movie_provider.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesProvider();
  Future<MoviesModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<MoviesModel> fetchTopRated() => moviesApiProvider.fetchMoviesTopRated();

  Future<MovieDetailModel> fetchMovieDetail({@required int id}) {
    return  moviesApiProvider.fetchMoviesDetail(id: id );
  }
}