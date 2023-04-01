import 'package:flutter/material.dart';
import 'package:movies/service/apiservice.dart';

import '../model/moviemodel/detailsmoviemodel.dart';
import '../model/moviemodel/moviemodel.dart';


class MovieProvider with ChangeNotifier {
  late Future<List<MovieModel>> _movies;

  


  int _counterPage = 0;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  int get counterPage => _counterPage;

  void setCounterPage(int countrPage) {
    _counterPage = countrPage;
    notifyListeners();
  }

  void setCurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  addCurrentIndex() {
    _currentIndex++;
    notifyListeners();
  }

  removeCurrentIndex() {
    _currentIndex--;
    notifyListeners();
  }

  Future<List<MovieModel>> get movies => _movies;

  Future<List<MovieModel>> getAllMovies(
      {required String movieItem, required String page}) async {
    _movies = ApiService.getAllMovies(
        movieItem: movieItem, page: (_counterPage+1).toString());
    return _movies;
  }

  MovieDetailsModel? movieDetailsModel;
  bool isLoading = false;

  getMovideDetails({required String id}) async {
    isLoading = true;
    movieDetailsModel = await ApiService.getDetailsMovie(id: id);
    isLoading = false;
    notifyListeners();
  }
}
