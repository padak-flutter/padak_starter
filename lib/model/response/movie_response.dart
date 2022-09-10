class MovieResponse {
  // 배우진
  String actor = "";

  // 개봉일
  String date = "";

  // 감독
  String director = "";

  // 총 관람객수
  int audience = 0;

  // 유저 평점
  int userRating = 0;

  // 영화 고유 ID
  String id = "";

  // 예매율
  double reservationRate;

  // 관람 등급 (0 : 전체 / 12 : 12세 / 15 : 15세 / 19 :19세)
  int grade = 0;

  // 제목
  String title = "";

  // 장르명
  String genre = "";

  // 포스터 이미지 URL
  String image = "";

  // 영화 상영길이
  int duration = 0;

  // 줄거리
  String synopsis = "";

  // 예매 순위
  int reservationGrade = 0;

  // 생성자
  MovieResponse({
    required this.actor,
    required this.date,
    required this.director,
    required this.audience,
    required this.userRating,
    required this.id,
    required this.reservationGrade,
    required this.grade,
    required this.title,
    required this.genre,
    required this.image,
    required this.duration,
    required this.synopsis,
    required this.reservationRate,
  });

  // map 구조에서 새로운 MovieResponse 객체를 생성
  MovieResponse.fromJson(Map<String, dynamic> json)
      : actor = json['actor'],
        date = json['date'],
        director = json['director'],
        audience = json['audience'],
        userRating = json['user_rating'],
        id = json['id'],
        reservationGrade = json['reservation_grade'],
        grade = json['grade'],
        title = json['title'],
        genre = json['genre'],
        image = json['image'],
        duration = json['duration'],
        synopsis = json['synopsis'],
        reservationRate = json['reservation_rate'];

  // MovieResponse 객체를 map 구조로 변환
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
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
