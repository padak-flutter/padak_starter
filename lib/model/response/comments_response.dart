class CommentsResponse {
  final String movieId;
  final List<dynamic> comments;

  // 생성자
  const CommentsResponse({this.movieId, this.comments});

  // map 구조에서 새로운 CommentsResponse 객체를 생성
  CommentsResponse.fromJson(Map<String, dynamic> json)
      : movieId = json['movie_id'],
        comments = json['comments'];

  // CommentsResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {'movie_id': movieId, 'comments': comments};
}
