class CommentsResponse {
  String movieId;
  List<Comment> comments;

  CommentsResponse(this.movieId, this.comments);

  // map 구조에서 새로운 CommentsResponse 객체를 생성
  CommentsResponse.fromJson(Map<String, dynamic> json) {
    movieId = json['movie_id'];
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((comment) {
        comments.add(Comment.fromJson(comment));
      });
    }
  }

  // CommentsResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['movie_id'] = movieId;
    if (comments != null) {
      map['comments'] = comments.map((comment) => comment.toMap()).toList();
    }
    return map;
  }
}

class Comment {
  int timestamp;
  String id;
  String movieId;
  double rating;
  String contents;
  String writer;

  Comment({
    this.rating,
    this.id,
    this.timestamp,
    this.writer,
    this.contents,
    this.movieId
  });

  Comment.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    id = json['id'];
    movieId = json['movie_id'];
    rating = json['rating'].toDouble();
    contents = json['contents'];
    writer = json['writer'];
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['timestamp'] = timestamp;
    map['id'] = id;
    map['movie_id'] = movieId;
    map['rating'] = rating;
    map['contents'] = contents;
    map['writer'] = writer;
    return map;
  }
}

