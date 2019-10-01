class MoviesResponse {
  final int orderType;
  final List<dynamic> movies;

  // 생성자
  const MoviesResponse({
    this.orderType,
    this.movies,
  });

  // map 구조에서 새로운 MoviesResponse 객체를 생성
  MoviesResponse.fromJson(Map<String, dynamic> json)
      : orderType = json['order_type'],
        movies = json['movies'];

  // MoviesResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {
        'order_type': orderType,
        'movies': movies,
      };
}
