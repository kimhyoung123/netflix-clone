import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/model/model_movie.dart';
import 'package:my_first_flutter_project/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxIamges(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxIamges(BuildContext context ,List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              },
              fullscreenDialog: true),
        );},
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.network(movies[i].poster),
          ),
        ),
      ),
    );
  }
  return results;
}