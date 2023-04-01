import 'package:flutter/material.dart';
import 'package:movies/model/tvshowmodel/detailstvshowmodel.dart';
import 'package:movies/model/tvshowmodel/populartvshowmodel.dart';
import 'package:movies/service/apiservice.dart';

class TVShowProvider with ChangeNotifier {
  late Future<List<TVShowModel>> _tvshow;

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

  Future<List<TVShowModel>> get movies => _tvshow;

  Future<List<TVShowModel>> getAllTVShow(
      {required String tvshowItem, required String page}) async {
    _tvshow = ApiService.getAllTVShow(
      tvshowitem: tvshowItem,
      page: (_counterPage + 1).toString(),
    );
    return _tvshow;
  }

  TVShowDetailsModel? tvShowDetailsModel;
  bool isLoading = false;

  getTVShowDetails({required String id}) async {
    isLoading = true;
    tvShowDetailsModel = await ApiService.getDetailsTVShow(id: id);
    isLoading = false;
    notifyListeners();
  }
}
