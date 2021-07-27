import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/detail_screen.dart';
import 'package:movie_app/utils/constants.dart';

class GridItemList extends StatelessWidget {
  List<Movie> movieList;

  GridItemList({required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 6 / 10,
        padding: EdgeInsets.all(4.0),
        children: this.movieList.map((movie) {
          return GridItem(
            movie: movie,
          );
        }).toList(),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  Movie movie;

  GridItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      movie: movie,
                    )));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 6.0 / 8,
              child: Image.network(
                IMAGE_URL + movie.poster,
                fit: BoxFit.cover,
              ),
            ),
            AspectRatio(
              aspectRatio: 6 / 2,
              child: Center(
                child: Text(
                  movie.title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
