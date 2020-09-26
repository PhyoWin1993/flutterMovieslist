import 'package:flutter/material.dart';
import 'package:list/model/movie.dart';

import 'movie_ui.dart';

class MovieList extends StatelessWidget {
  final List<Movie> moviesList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: Text("Movies List"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade300,
      body: ListView.builder(
        itemCount: moviesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: <Widget>[
            Positioned(child: moviesCard(moviesList[index], context)),
            Positioned(
                left: 10.0,
                top: 10.0,
                child: movieImage(moviesList[index].images[0])),
          ]);

          // return Card(
          //   elevation: 4.5,
          //   color: Colors.white,
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.blue,
          //           borderRadius: BorderRadius.circular(13.7),
          //           image: DecorationImage(
          //               image: NetworkImage(moviesList[index].images[0]),
          //               fit: BoxFit.cover),
          //         ),
          //         // child: Text("H"),
          //       ),
          //     ),
          //     title: Text(moviesList[index].title),
          //     subtitle: Text(mList[index]["Language"]),
          //     trailing: Text("....."),
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => MoviesListViewDetail(
          //                     moviesName: moviesList[index].title,
          //                     movie: moviesList[index],
          //                   )));
          //     },
          //     // onTap: () =>
          //     // debugPrint("Movies Name : ${movies.elementAt(index)}"),
          //   ),
          // );
        },
      ),
    );
  }

  Widget moviesCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60.0),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text("Rating : ${movie.imdbRating} /10 ",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Release : ${movie.released}",
                          style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviesListViewDetail(
                        moviesName: movie.title,
                        movie: movie,
                      )),
            ));
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 13.0, color: Colors.grey);
  }

  Widget movieImage(String imgUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
    );
  }
}

//New Route

class MoviesListViewDetail extends StatelessWidget {
  final String moviesName;
  final Movie movie;

  const MoviesListViewDetail({Key key, this.moviesName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: Text("Movies ${this.moviesName}"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          MovieDetailThumbnail(thumbnail: movie.images[1]),
          MovieDetailHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailExtraPoster(
            poster: movie.images,
          )
        ],
      ),
      // body: Center(
      //   child: Container(
      //     // ignore: missing_required_param
      //     child: RaisedButton(
      //       child: Text("Go Back"),
      //       onPressed: () => Navigator.pop(context),
      //     ),
      //   ),
      // ),
    );
  }
}
