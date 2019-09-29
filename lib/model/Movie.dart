class Movie {
  final String title;
  final double userRating;
  final int grade;
  final int reservationGrade;
  final String id;
  final String date;
  final String thumb;
  final double reservationRate;

  // 생성자
  Movie(
    this.title,
    this.userRating,
    this.grade,
    this.reservationGrade,
    this.id,
    this.date,
    this.thumb,
    this.reservationRate,
  );

  // map 구조에서 새로운 Movie 객체를 생성
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        userRating = json['user_rating'],
        grade = json['grade'],
        reservationGrade = json['reservation_grade'],
        id = json['id'],
        date = json['date'],
        thumb = json['thumb'],
        reservationRate = json['reservation_rate'];

  // Movie 객체를 map 구조로 변환
  Map<String, dynamic> toMap() => {
        'title': title,
        'user_rating': userRating,
        'grade': grade,
        'reservation_grade': reservationGrade,
        'id': id,
        'date': date,
        'thumb': thumb,
        'reservation_rate': reservationRate,
      };
}
