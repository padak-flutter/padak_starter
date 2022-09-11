import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:padak_starter/model/response/comments_response.dart';
import 'package:padak_starter/model/response/movie_response.dart';
import 'package:padak_starter/model/response/movies_response.dart';

const String API = 'padakpadak.run.goorm.io';

class MovieDataSource {
  // 4-1. 메인화면 - 1. 영화 목록 불러오기 API 구현
  static Future<List<Movie>> requestMovies(int selectedSortIndex) async {
    // 1. 서버에 요청을 진행하여 응답 데이터를 가져옴
    final response = await http.get(Uri.http(API, '/movies', {
      'order_type': {'$selectedSortIndex'},
    }));

    // 2. 서버로부터 받아온 응답 데이터를 기반으로 영화 목록 데이터를 가져옴
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final moviesResponse = MoviesResponse.fromJson(jsonData);

      return moviesResponse.movies;
    } else {
      throw Error();
    }
  }

  // 5-1. 상세화면 - 2. 영화 상세 데이터 가져오기 API 구현
  static Future<MovieResponse> requestMovie(String movieId) async {
    // 1. 서버에 요청을 진행하여 응답 데이터를 가져옴
    final response = await http.get(Uri.http(API, '/movie', {
      'id': {movieId},
    }));

    // 2. 서버로부터 받아온 응답 데이터를 기반으로 영화 목록 데이터를 가져옴
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final moviesResponse = MovieResponse.fromJson(jsonData);

      return moviesResponse;
    } else {
      throw Error();
    }
  }

  // 5-2. 상세화면 - 3. 한줄평 목록 API 구현
  static Future<CommentsResponse> requestComments(String movieId) async {
    // 1. 서버에 요청을 진행하여 응답 데이터를 가져옴
    final response = await http.get(Uri.http(API, '/comments', {
      'movie_id': {movieId},
    }));

    // 2. 서버로부터 받아온 응답 데이터를 기반으로 영화 목록 데이터를 가져옴
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final commentsResponse = CommentsResponse.fromJson(jsonData);

      return commentsResponse;
    } else {
      throw Error();
    }
  }

  // 6-1. 한줄평 입력 화면 - 4. 한줄평 등록 API 구현
  static Future<CommentsResponse> postComment({
    required int rating,
    required String movie,
    required int timestamp,
    required String writer,
    required String contents,
  }) async {
    // 1. 서버에 요청을 진행하여 응답 데이터를 가져옴
    final response = await http.post(Uri.http(API, '/comment'), body: {
      "rating": '$rating',
      "movie_id": movie,
      "timestamp": '$timestamp',
      "writer": writer,
      "contents": contents
    });

    // 2. 서버로부터 받아온 응답 데이터를 기반으로 영화 목록 데이터를 가져옴
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final commentsResponse = CommentsResponse.fromJson(jsonData);

      return commentsResponse;
    } else {
      throw Error();
    }
  }
}
