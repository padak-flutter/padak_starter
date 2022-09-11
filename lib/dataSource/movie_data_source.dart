import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
