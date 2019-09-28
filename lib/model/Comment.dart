class CommentResponse {
  final double rating;
  final double timestamp;
  final String writer;
  final String movie_id;
  final String contents;
  final String id;

  // 생성자
  CommentResponse(this.rating, this.timestamp, this.writer, this.movie_id,
      this.contents, this.id);

  // map 구조에서 새로운 CommentsResponse 객체를 생성
  CommentResponse.fromJson(Map<String, dynamic> json)
      : rating = json['rating'],
        timestamp = json['timestamp'],
        writer = json['writer'],
        movie_id = json['movie_id'],
        contents = json['contents'],
        id = json['id'];

  // CommentsResponse 객체를 map 구조로 변환
  Map<String, dynamic> toJson() => {
        'rating': rating,
        'timestamp': timestamp,
        'writer': writer,
        'movie_id': movie_id,
        'contents': contents,
        'id': id
      };
}
