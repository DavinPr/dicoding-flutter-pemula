import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/utils/constants.dart';

class DetailScreen extends StatelessWidget {
  Movie movie;

  DetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Movie Detail',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        IMAGE_URL + movie.poster,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Wrap(
                            children: [
                              Text(
                                'Release Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                movie.date,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                movie.voteAvg.toString(),
                                style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 50,
              thickness: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: ListTile(
                title: Text(
                  "Overview",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  movie.overview,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
