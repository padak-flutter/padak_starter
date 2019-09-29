class CommentResponse {
  final double rating;
  final double timestamp;
  final String writer;
  final String movieId;
  final String contents;
  final String id;

  // 생성자
  CommentResponse(
    this.rating,
    this.timestamp,
    this.writer,
    this.movieId,
    this.contents,
    this.id,
  );

  // map 구조에서 새로운 CommentsResponse 객체를 생성
  CommentResponse.fromJson(Map<String, dynamic> json)
      : rating = json['rating'],
        timestamp = json['timestamp'],
        writer = json['writer'],
        movieId = json['movie_id'],
        contents = json['contents'],
        id = json['id'];

  // CommentsResponse 객체를 map 구조로 변환
  Map<String, dynamic> toJson() => {
        'rating': rating,
        'timestamp': timestamp,
        'writer': writer,
        'movie_id': movieId,
        'contents': contents,
        'id': id,
      };
}
