class CommentsResponse {
  final List<dynamic> comments;

  // 생성자
  CommentsResponse(this.comments);

  // map 구조에서 새로운 MoviesResponse 객체를 생성
  CommentsResponse.fromJson(Map<String, dynamic> json)
      : comments = json['comments'];

  // MoviesResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {'comments': comments};
}
