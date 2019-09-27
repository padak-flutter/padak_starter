class Movie {
  final String title;
  final double user_rating;
  final int grade;
  final int reservation_grade;
  final String id;
  final String date;
  final String thumb;
  final double reservation_rate;

  // 생성자
  Movie(this.title,
      this.user_rating,
      this.grade,
      this.reservation_grade,
      this.id,
      this.date,
      this.thumb,
      this.reservation_rate);

  // map 구조에서 새로운 Movie 객체를 생성
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        user_rating = json['user_rating'],
        grade = json['grade'],
        reservation_grade = json['reservation_grade'],
        id = json['id'],
        date = json['date'],
        thumb = json['thumb'],
        reservation_rate = json['reservation_rate'];

  // Movie 객체를 map 구조로 변환
  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'user_rating': user_rating,
        'grade': grade,
        'reservation_grade': reservation_grade,
        'id': id,
        'date': date,
        'thumb': thumb,
        'reservation_rate': reservation_rate
      };
}