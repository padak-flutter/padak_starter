import 'package:flutter/material.dart';
import 'package:padak_starter/detail_page.dart';

// 1-3. 리스트 화면 (임포트)
import 'model/data/dummys_repository.dart';
import 'model/response/movies_response.dart';

class ListPage extends StatelessWidget {
  // 4-2. 메인화면 - ListPage 매개변수 생성
  final List<Movie> movies;

  // 4-2. 메인화면 - ListPage 생성자 만들기
  const ListPage({
    required this.movies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 4-2. 메인화면 - movies 변수 삭제
    return ListView.separated(
      separatorBuilder: (_, index) => const Divider(color: Colors.grey),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: ListItemWidget(movie: movies[index]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailPage(movieId: movies[index].id),
              ),
            );
          },
        );
      },
    );
  }
}

class ListItemDummyWidget extends StatelessWidget {
  const ListItemDummyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/1.jpg',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Text(
                      '신과함께-죄와벌',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    ListItemGradeImageWidget(grade: 12),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const <Widget>[
                    Text('평점 : 139'),
                    SizedBox(width: 10),
                    Text('예매순위 : 1'),
                    SizedBox(width: 10),
                    Text('예매율 : 35.5')
                  ],
                ),
                const SizedBox(height: 10),
                const Text('개봉일 : 2017-12-20')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Movie movie;

  const ListItemWidget({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(movie.thumb, height: 100),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ListItemGradeImageWidget(grade: movie.grade),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : ${movie.userRating / 2}'),
                    const SizedBox(width: 10),
                    Text('예매순위 : ${movie.reservationGrade}'),
                    const SizedBox(width: 10),
                    Text('예매율 : ${movie.reservationRate}')
                  ],
                ),
                const SizedBox(height: 10),
                Text('개봉일 : ${movie.date}')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListItemGradeImageWidget extends StatelessWidget {
  final int grade;

  const ListItemGradeImageWidget({
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return const SizedBox();
    }
  }
}
