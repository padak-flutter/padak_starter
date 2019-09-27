import 'dart:convert';

class GetMoviesResponse {
  final int order_type;
  final List<dynamic> movies;

  // 생성자
  GetMoviesResponse(this.order_type, this.movies);

  // map 구조에서 새로운 GetMoviesResponse 객체를 생성
  GetMoviesResponse.fromJson(Map<String, dynamic> json)
      : order_type = json['order_type'],
        movies = json['movies'];

  // GetMoviesResponse 객체를 map 구조로 변환
  Map<String, dynamic> toJson() => {
        'order_type': order_type,
        'movies': movies,
      };
}

// jsonString 으로부터 값 뽑아내기
GetMoviesResponse getJsonObjectByStr(String jsonString) {
  Map userMap = jsonDecode(jsonString);

  var data = GetMoviesResponse.fromJson(userMap);
  return data;
}
