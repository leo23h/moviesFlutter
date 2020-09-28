import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/models/MovieModel.dart';
import '../blocs/movies_bloc.dart';
import 'movies_detail.dart';


class MovieListApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test movies',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MoviesAppFull(),
    );
  }
}

class MoviesAppFull extends StatefulWidget {
  MoviesAppFull({Key key}) : super(key: key);

  @override
  _MoviesAppState createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesAppFull> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 92, 161, 212)
              ),
              child: Column(
                children: [
                  Container(
                        padding: EdgeInsets.only(top: 80, left: 40, right: 40, bottom: 15),
                        child: Text(
                          'Hello, What do you want to watch ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),
                        )
                    ),

                  Container(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 142, 190, 225),
                        hoverColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                            borderSide: new BorderSide(
                              color: Color.fromARGB(255, 142, 190, 225),
                              width: 0,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                            borderSide: new BorderSide(
                              color: Color.fromARGB(255, 142, 190, 225),
                              width: 0,
                            ),
                          ),
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 40, 53, 70),
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'RECOMMENDED FOR YOU',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                  ),
                                ),
                              ),

                              Container(
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        builderPopulatedMovies(context),

                        Container(
                          padding: EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'TOP RATED',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        builderTopRatedMovies(context)
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

  Widget builderPopulatedMovies(BuildContext context){
    bloc.fetchAllMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<MoviesModel> snapshot) {
        if (snapshot.hasData) {
          return buildListMovies(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget builderTopRatedMovies(BuildContext context){
    bloc.fetchTopRatedMovies();
    return StreamBuilder(
      stream: bloc.topRatedMovies,
      builder: (context, AsyncSnapshot<MoviesModel> snapshot) {
        if (snapshot.hasData) {
          return buildListMovies(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildListMovies(AsyncSnapshot<MoviesModel> snapshot){
      return Container(
        padding: EdgeInsets.only(left: 20),
        height: MediaQuery.of(context).size.height/2.84,
        child: ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.results.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w185${snapshot.data
                                .results[index].poster_path}',
                            width: 130,
                          )
                      ),

                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoviesDetailApp()),
                        );
                      },
                    ),

                    InkWell(
                      child: Container(
                          width: MediaQuery.of(context).size.width/2.8,
                          padding: EdgeInsets.only(right: 15, top: 10),
                          child: Text(
                            snapshot.data.results[index].original_title,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          )
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoviesDetailApp()),
                        );
                      },
                    ),

                    Container(
                        width: MediaQuery.of(context).size.width/2.8,
                        padding: EdgeInsets.only(right: 15, top: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),

                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),

                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),

                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),

                            Container(
                              child: Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              ),
                            ),

                          ],
                        )
                    )


                  ],
                ),
              );
            }
        ),
      );
  }








}
