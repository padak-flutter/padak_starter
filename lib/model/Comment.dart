class Comment {
  final double rating;
  final double timestamp;
  final String writer;
  final String movieId;
  final String contents;
  final String id;

  // 생성자
  const Comment({
    this.rating,
    this.timestamp,
    this.writer,
    this.movieId,
    this.contents,
    this.id,
  });

  // map 구조에서 새로운 Comment 객체를 생성
  Comment.fromJson(Map<String, dynamic> json)
      : rating = json['rating'],
        timestamp = json['timestamp'],
        writer = json['writer'],
        movieId = json['movie_id'],
        contents = json['contents'],
        id = json['id'];

  // Comment 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {
        'rating': rating,
        'timestamp': timestamp,
        'writer': writer,
        'movie_id': movieId,
        'contents': contents,
        'id': id,
      };
}
