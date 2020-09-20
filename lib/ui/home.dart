import 'package:flutter/material.dart';
import 'package:list/model/movie.dart';

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
          return moviesCard(moviesList[index], context);

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
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Movies Object"),
            ],
          ),
        ),
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
      backgroundColor: Colors.blueGrey.shade300,
      body: Center(
        child: Container(
          // ignore: missing_required_param
          child: RaisedButton(
            child: Text("Go Back"),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
