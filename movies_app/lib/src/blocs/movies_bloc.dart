import 'package:movies_app/src/models/MovieModel.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class MoviesBloc {
  final _repository = MoviesRepository();
  final _moviesFetcher = PublishSubject<MoviesModel>();
  final _moviesTopRatedFetcher = PublishSubject<MoviesModel>();

  Observable<MoviesModel> get allMovies => _moviesFetcher.stream;
  Observable<MoviesModel> get topRatedMovies => _moviesTopRatedFetcher.stream;

  fetchAllMovies() async {
    MoviesModel moviesModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(moviesModel);
  }

  fetchTopRatedMovies() async {
    MoviesModel moviesModel = await _repository.fetchTopRated();
    _moviesTopRatedFetcher.sink.add(moviesModel);
  }

  dispose() {
    _moviesFetcher.close();
    _moviesTopRatedFetcher.close();
  }
}

final bloc = MoviesBloc();