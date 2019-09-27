import 'dart:convert';
import 'package:flutter/services.dart';
import '../getMoviesResponse.dart';

String getDummy() {
  return '{"movies":[{"title":"신과함께-죄와벌","user_rating":7.98,"grade":12,"reservation_grade":1,"id":"5a54c286e8a71d136fb5378e","date":"2017-12-20","thumb":"http://movie.phinf.naver.net/20171201_181/1512109983114kcQVl_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":35.5},{"title":"저스티스 리그","user_rating":7.8,"grade":12,"reservation_grade":2,"id":"5a54c1e9e8a71d136fb5376c","date":"2017-11-15","thumb":"http://movie2.phinf.naver.net/20170925_296/150631600340898aUX_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":12.63},{"title":"토르:라그나로크","user_rating":9.8,"grade":12,"reservation_grade":3,"id":"5a54c1f2e8a71d136fb5376e","date":"2017-10-25","thumb":"http://movie2.phinf.naver.net/20170928_85/1506564710105ua5fS_PNG/movie_image.jpg?type=m99_141_2","reservation_rate":6.73},{"title":"러빙 빈센트","user_rating":8.5,"grade":15,"reservation_grade":4,"id":"5a54c1fbe8a71d136fb53770","date":"2017-11-09","thumb":"http://movie2.phinf.naver.net/20171013_210/1507861351048TMJcR_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":3.82},{"title":"범죄도시","user_rating":3.4,"grade":19,"reservation_grade":5,"id":"5a54c207e8a71d136fb53772","date":"2017-10-03","thumb":"http://movie2.phinf.naver.net/20170915_299/1505458505658vbKcN_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":2.37},{"title":"꾼","user_rating":6.4,"grade":15,"reservation_grade":6,"id":"5a54be21e8a71d136fb536a1","date":"2017-11-22","thumb":"http://movie2.phinf.naver.net/20171107_251/1510033896133nWqxG_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":61.69},{"title":"쥬만지: 새로운 세계","user_rating":8.01,"grade":12,"reservation_grade":7,"id":"5a54c2f8e8a71d136fb537a7","date":"2018-01-03","thumb":"http://movie.phinf.naver.net/20171127_196/1511757905894vduNA_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":14.93},{"title":"뽀로로 극장판 공룡섬 대모험","user_rating":9.2,"grade":0,"reservation_grade":8,"id":"5a54df5ee8a71d136fb53d75","date":"2017-12-07","thumb":"http://movie.phinf.naver.net/20171102_209/1509602233507BiJrs_JPEG/movie_image.jpg?type=m99_141_2","reservation_rate":1.93}],"order_type":0}';
}

Future<String> loadJsonStr() async {
  String jsonCrossword = await rootBundle.loadString('assets/dummy.json');

  return jsonCrossword;
}

Future<GetMoviesResponse> loadJsonObject() async{
  Map userMap = await jsonDecode('assets/dummy.json');

  var data = GetMoviesResponse.fromJson(userMap);
  return data;
}
