class MovieResponse {
  final int audience;
  final String actor;
  final int duration;
  final String director;
  final String synopsis;
  final String genre;
  final int grade;
  final String image;
  final int reservation_grade;
  final String title;
  final double reservation_rate;
  final double user_rating;
  final String date;
  final String id;

  // 생성자
  MovieResponse(
      this.audience,
      this.actor,
      this.duration,
      this.director,
      this.synopsis,
      this.genre,
      this.grade,
      this.image,
      this.reservation_grade,
      this.title,
      this.reservation_rate,
      this.user_rating,
      this.date,
      this.id);

  // map 구조에서 새로운 MoviesResponse 객체를 생성
  MovieResponse.fromJson(Map<String, dynamic> json)
      : audience = json['audience'],
        actor = json['actor'],
        duration = json['duration'],
        director = json['director'],
        synopsis = json['synopsis'],
        genre = json['genre'],
        grade = json['grade'],
        image = json['image'],
        reservation_grade = json['reservation_grade'],
        title = json['title'],
        reservation_rate = json['reservation_rate'],
        user_rating = json['user_rating'],
        date = json['date'],
        id = json['id'];

  // MoviesResponse 객체를 map 구조로 변환
  Map<String, dynamic> toJson() => {
        'audience': audience,
        'actor': actor,
        'duration': duration,
        'director': director,
        'synopsis': synopsis,
        'genre': genre,
        'grade': grade,
        'image': image,
        'reservation_grade': reservation_grade,
        'title': title,
        'reservation_rate': reservation_rate,
        'user_rating': user_rating,
        'date': date,
        'id': id,
      };
}
