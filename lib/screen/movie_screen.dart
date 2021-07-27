import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/grid_item_list.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridItemList(movieList: movieList);
  }
}
