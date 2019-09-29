class MovieResponse {
  final int audience;
  final String actor;
  final int duration;
  final String director;
  final String synopsis;
  final String genre;
  final int grade;
  final String image;
  final int reservationGrade;
  final String title;
  final double reservationRate;
  final double userRating;
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
      this.reservationGrade,
      this.title,
      this.reservationRate,
      this.userRating,
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
        reservationGrade = json['reservation_grade'],
        title = json['title'],
        reservationRate = json['reservation_rate'],
        userRating = json['user_rating'],
        date = json['date'],
        id = json['id'];

  // MoviesResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {
        'audience': audience,
        'actor': actor,
        'duration': duration,
        'director': director,
        'synopsis': synopsis,
        'genre': genre,
        'grade': grade,
        'image': image,
        'reservation_grade': reservationGrade,
        'title': title,
        'reservation_rate': reservationRate,
        'user_rating': userRating,
        'date': date,
        'id': id,
      };
}
