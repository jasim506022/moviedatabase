import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../const/apiconstant.dart';
import '../model/moviemodel/detailsmoviemodel.dart';
import '../model/moviemodel/moviemodel.dart';
import '../model/tvshowmodel/detailstvshowmodel.dart';
import '../model/tvshowmodel/populartvshowmodel.dart';

class ApiService {
//status_message
  static Future<List<dynamic>> getData({
    required String target,
    required String itemname,
    required String page,
  }) async {
    try {
      var response = await http.get(Uri.parse(
          "$BASE_URL/$target/$itemname?api_key=$API_KEY&language=en-US&page=$page"));

      var data = jsonDecode(response.body);
      List templisth = [];
      if (response.statusCode != 200) {
        throw data["status_message"];
      }

      for (var v in data["results"]) {
        templisth.add(v);
      }
      return templisth;
    } catch (error) {
      if (kDebugMode) {
        print("An Error Occured $error");
      }
      throw error.toString();
    }
  }

  static Future<List<MovieModel>> getAllMovies(
      {required String movieItem, required String page}) async {
    List temp = await getData(target: "movie", itemname: movieItem, page: page);
    return MovieModel.snaphshotPopularMovieList(temp);
  }

  static Future<List<TVShowModel>> getAllTVShow(
      {required String tvshowitem, required String page}) async {
    List temp = await getData(target: "tv", itemname: tvshowitem, page: page);
    return TVShowModel.snaphshotPopularTVList(temp);
  }

  // static Future<List<MovieModel>> getAllPopularMovieModel(
  //     {required String movieItem, required String page}) async {
  //   var response = await http.get(Uri.parse(
  //       "$BASE_URL/movie/$movieItem?api_key=$API_KEY&language=en-US&page=$page"));
  //   var data = jsonDecode(response.body);
  //   List<dynamic> templisth = [];
  //   if (data['results'] == null) {
  //     if (kDebugMode) {
  //       "Something is wrong";
  //     }
  //   }
  //   for (var v in data["results"]) {
  //     templisth.add(v);
  //   }
  //   return MovieModel.snaphshotPopularMovieList(templisth);
  // }

  // static Future<List<TVShowModel>> getAllPopularTVShow(
  //     {required String tvshowitem, required String page}) async {
  //   var response = await http.get(Uri.parse(
  //       "https://api.themoviedb.org/3/tv/$tvshowitem?api_key=e907f0090f8017ebd77396aa04c3d648&language=en-US&page=$page"));
  //   var data = jsonDecode(response.body);
  //   List templisth = [];
  //   for (var v in data["results"]) {
  //     templisth.add(v);
  //   }
  //   return TVShowModel.snaphshotPopularTVList(templisth);
  // }

  static Future<List<MovieModel>> getAllSearchMovie(
      {required String title}) async {
    var response = await http
        .get(Uri.parse("$BASE_URL/search/multi?api_key=$API_KEY&query=$title"));

    var data = jsonDecode(response.body);
    List templisth = [];

    for (var v in data["results"]) {
      templisth.add(v);
    }
    return MovieModel.snaphshotPopularMovieList(templisth);
  }

  static Future<MovieDetailsModel> getDetailsMovie({required String id}) async {
    var response = await http.get(Uri.parse(
        "$BASE_URL/movie/$id?api_key=$API_KEY&append_to_response=credits,reviews,similar"));

    var data = jsonDecode(response.body);

    return MovieDetailsModel.fromMap(data);
  }

  static Future<TVShowDetailsModel> getDetailsTVShow(
      {required String id}) async {
    var response = await http.get(Uri.parse(
        "$BASE_URL/tv/$id?api_key=$API_KEY&append_to_response=videos,similar,credits"));

    var data = jsonDecode(response.body);

    return TVShowDetailsModel.fromMap(data);
  }
}
