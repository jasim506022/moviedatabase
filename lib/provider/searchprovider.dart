import 'package:flutter/material.dart';

import '../model/moviemodel/moviemodel.dart';
import '../service/apiservice.dart';

class SearchProvider with ChangeNotifier {
 late Future<List<MovieModel>> _searchMovie;

 Future<List<MovieModel>> get searchMovie => _searchMovie;

  String _search = "";

  String get search => _search;

  setSearch(String search) {
    _search = search;
    notifyListeners();
  }


  Future<List<MovieModel>> getAllMovies(
      {required String search, }) async {
    _searchMovie = ApiService.getAllSearchMovie(title: search);
    return _searchMovie;
  }
}
