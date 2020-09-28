class MovieDetailModel {
  bool _adult;
  String _backdrop_path;
  int _budget;
  String _homepage;
  int _id;
  String _imdb_id;
  String _original_language;
  String _original_title;
  String _overview;
  int _popularity;
  String _poster_path;
  String _release_date;
  int _revenue;
  int _runtime;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  int _vote_average;
  int _vote_count;
  BelongsCollectionModel _belong_to_collection;
  List<GenresModel> _genres = [];
  List<ProductionCompanyModel> _productionCompany = [];
  List<ProductionCountriesModel> _productionCountry = [];
  List<SpokenLanguagesModel> _spokenLanguage = [];

  MovieDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    _adult = parsedJson['adult'];
    _backdrop_path = parsedJson['backdrop_path'];
    _budget = parsedJson['budget'];
    _homepage = parsedJson['homepage'];
    _id = parsedJson['id'];
    _imdb_id = parsedJson['imdb_id'];
    _original_language = parsedJson['original_language'];
    _original_title = parsedJson['original_title'];
    _overview = parsedJson['overview'];
    _popularity = parsedJson['popularity'];
    _poster_path = parsedJson['poster_path'];
    _release_date = parsedJson['release_date'];
    _revenue = parsedJson['revenue'];
    _runtime = parsedJson['runtime'];
    _status = parsedJson['status'];
    _tagline = parsedJson['tagline'];
    _title = parsedJson['title'];
    _video = parsedJson['video'];
    _vote_average = parsedJson['vote_average'];
    _vote_count = parsedJson['vote_count'];
    _belong_to_collection = parsedJson['belongs_to_collection'];
    //list temp
    List<GenresModel> genresTemp = [];
    List<ProductionCompanyModel> productionCompanyTemp = [];
    List<ProductionCountriesModel> productionCountriesTemp = [];
    List<SpokenLanguagesModel> spokenLanguageTemp = [];


    //genres
    for (int i = 0; i < parsedJson['genres'].length; i++) {
      GenresModel result = GenresModel(parsedJson['genres'][i]);
      genresTemp.add(result);
    }
    _genres = genresTemp;

    //production companies
    for (int j = 0; j < parsedJson['production_companies'].length; j++) {
      ProductionCompanyModel result = ProductionCompanyModel(parsedJson['production_companies'][j]);
      productionCompanyTemp.add(result);
    }
    _productionCompany = productionCompanyTemp;

    //production countries
    for (int k = 0; k < parsedJson['production_countries'].length; k++) {
      ProductionCountriesModel result = ProductionCountriesModel(parsedJson['production_countries'][k]);
      productionCountriesTemp.add(result);
    }
    _productionCountry = productionCountriesTemp;


    //Spoken language
    for (int l = 0; l < parsedJson['spoken_languages'].length; l++) {
      SpokenLanguagesModel result = SpokenLanguagesModel(parsedJson['spoken_languages'][l]);
      spokenLanguageTemp.add(result);
    }
    _spokenLanguage = spokenLanguageTemp;
}


  bool get adult => _adult;
  String get backdrop_path => _backdrop_path;
  int get budget => _budget;
  String get homepage => _homepage;
  int get id => _id;
  String get imdb_id => _imdb_id;
  String get original_language => _original_language;
  String get original_title => _original_title;
  String get overview => _overview;
  int get popularity => _popularity;
  String get poster_path => _poster_path;
  String get release_date => _release_date;
  int get revenue => _revenue;
  int get runtime => _runtime;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  int get vote_average => _vote_average;
  int get vote_count => _vote_count;
  BelongsCollectionModel get belong_to_collection => _belong_to_collection;
  List<ProductionCompanyModel> get productionCompany => _productionCompany;
  List<GenresModel> get genres => _genres;
  List<ProductionCountriesModel> get productionCountries => _productionCountry;
  List<SpokenLanguagesModel> get spokenLanguage => _spokenLanguage;
}

class BelongsCollectionModel {
  int _id;
  String _name;
  String _poster_path;
  String _backdrop_path;


  BelongsCollectionModel(result){
    _id = result['id'];
    _name = result['name'];
    _poster_path = result['poster_path'];
    _backdrop_path = result['backdrop_path'];
  }

  int get id => _id;
  String get name => _name;
  String get poster_path => _poster_path;
  String get backdrop_path => _backdrop_path;
}


class GenresModel{
  int _id;
  String _name;

  GenresModel(result){
    _id = result['id'];
    _name= result['name'];
  }

  int get id => _id;
  String get name => _name;
}


class ProductionCompanyModel{
  int _id;
  String _logo_path;
  String _name;
  String _origin_country;

  ProductionCompanyModel(result){
    _id = result['id'];
    _logo_path = result['logo_path'];
    _name= result['name'];
    _origin_country = result['origin_country'];
  }

  int get id => id;
  String get logo_path => _logo_path;
  String get name => _name;
  String get origin_country => _origin_country;

}

class ProductionCountriesModel{
  String _iso_3166_1;
  String _name;

  ProductionCountriesModel(result){
    _iso_3166_1 = result['iso_3166_1'];
    _name = result['name'];
  }

  String get iso_3166_1 => _iso_3166_1;
  String get name => _name;
}


class SpokenLanguagesModel{
  String _iso_639_1;
  String _name;

  SpokenLanguagesModel(result){
    _iso_639_1 = result['iso_639_1'];
    _name = result['name'];
  }

  String get iso_639_1 => _iso_639_1;
  String get name => _name;

}
