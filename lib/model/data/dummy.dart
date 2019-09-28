import 'dart:convert' as json;
import 'package:flutter/services.dart';
import 'package:padak_starter/model/response/MoviesResponse.dart';
import 'package:padak_starter/model/response/MovieResponse.dart';
import 'package:padak_starter/model/response/CommentsResponse.dart';

Future<String> loadJsonStr(String assetPath) async {
  final jsonCrossword = await rootBundle.loadString(assetPath);
  return jsonCrossword;
}

Future<MoviesResponse> loadMoviesData(String assetPath) async {
  final jsonString = await loadJsonStr(assetPath);
  final Map userMap = json.jsonDecode(jsonString);
  final data = MoviesResponse.fromJson(userMap);
  return data;
}

Future<MovieResponse> loadMovieData(String assetPath) async {
  final jsonString = await loadJsonStr(assetPath);
  final Map userMap = json.jsonDecode(jsonString);
  final data = MovieResponse.fromJson(userMap);
  return data;
}

Future<CommentsResponse> loadCommentsData(String assetPath) async {
  final jsonString = await loadJsonStr(assetPath);
  final Map userMap = json.jsonDecode(jsonString);
  final data = CommentsResponse.fromJson(userMap);
  return data;
}
