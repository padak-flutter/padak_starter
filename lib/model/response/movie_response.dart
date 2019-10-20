class MovieResponse {
  int audience;
  String actor;
  int duration;
  String director;
  String synopsis;
  String genre;
  int grade;
  String image;
  int reservationGrade;
  String title;
  double reservationRate;
  double userRating;
  String date;
  String id;

  // 생성자
  MovieResponse(
      this.actor,
      this.date,
      this.director,
      this.audience,
      this.userRating,
      this.id,
      this.reservationGrade,
      this.grade,
      this.title,
      this.genre,
      this.image,
      this.duration,
      this.synopsis,
      this.reservationRate);

  // map 구조에서 새로운 MovieResponse 객체를 생성
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

  // MovieResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['actor'] = actor;
    map['date'] = date;
    map['director'] = director;
    map['audience'] = audience;
    map['user_rating'] = userRating;
    map['id'] = id;
    map['reservation_grade'] = reservationGrade;
    map['grade'] = grade;
    map['title'] = title;
    map['genre'] = genre;
    map['image'] = image;
    map['duration'] = duration;
    map['synopsis'] = synopsis;
    map['reservation_rate'] = reservationRate;
    return map;
  }
}
