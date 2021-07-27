import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/grid_item_list.dart';
import 'package:movie_app/screen/movie_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> _list = [];

  void _textChangedResult(List<Movie> list) {
    setState(() {
      _list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: CupertinoSearchTextField(
            padding: EdgeInsets.all(12),
            onChanged: (query) {
              var filtered = movieList
                  .where((item) =>
                      item.title.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              (query.isEmpty)
                  ? _textChangedResult([])
                  : _textChangedResult(filtered);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: (_list.isNotEmpty)
              ? GridItemList(
                  movieList: _list,
                )
              : Center(
                  child: Text(
                    "Data is empty",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
