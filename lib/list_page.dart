import 'package:flutter/material.dart';

// 1-2. 리스트 화면 (임포트)
import 'detail_page.dart';
import 'model/data/dummys_repository.dart';
import 'model/response/movies_response.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-2. 리스트 화면 (동적 데이터 추가)
    final List<Movie> movies = DummysRepository.loadDummyMovies();

    // 1-2. 리스트 화면 (초기 리스트 구현)
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: Colors.grey),
      // 1-2. 리스트 화면 (동적 데이터 호출2)
      itemCount: movies.length,
      itemBuilder: (context, index) {
        // return _buildDummyItem();
        // 1-2. 리스트 화면 (동적 데이터 호출3)
        // 1-4. 상세화면 연결 (InkWell 사용)
        return InkWell(
          child: _buildItem(movies[index]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailPage(movies[index].id),
              ),
            );
          },
        );
      },
    );
  }

  // 1-2. 리스트 화면 (고정 더미 데이터)
  Widget _buildDummyItem(){
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network('http://movie.phinf.naver.net/20171201_181/1512109983114kcQVl_JPEG/movie_image.jpg', height: 120),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '신과함께-죄와벌',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    // 1-2. 리스트 화면 (UI 변경 제안 대처)
                    _buildGradeImage(12),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : 139'),
                    SizedBox(width: 10),
                    Text('예매순위 : 1'),
                    SizedBox(width: 10),
                    Text('예매율 : 35.5')
                  ],
                ),
                SizedBox(height: 10),
                Text('개봉일 : 2017-12-20')
              ],
            ),
          )
        ],
      ),
    );
  }

  // 1-2. 리스트 화면 (동적 데이터 호출1)
  Widget _buildItem(Movie movie) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
              movie.thumb,
              height: 120),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildGradeImage(movie.grade),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : ${movie.userRating / 2}'),
                    SizedBox(width: 10),
                    Text('예매순위 : ${movie.reservationGrade}'),
                    SizedBox(width: 10),
                    Text('예매율 : ${movie.reservationRate}')
                  ],
                ),
                SizedBox(height: 10),
                Text('개봉일 : ${movie.date}')
              ],
            ),
          )
        ],
      ),
    );
  }

  // 1-2. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)
  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return Image.asset("assets/ic_allages.png");
      case 12:
        return Image.asset("assets/ic_12.png");
      case 15:
        return Image.asset("assets/ic_15.png");
      case 19:
        return Image.asset("assets/ic_19.png");
      default:
        return null;
    }
  }
}