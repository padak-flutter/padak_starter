import "package:flutter/material.dart";
import 'model/response/comments_response.dart';
import 'model/response/movie_response.dart';

class DetailPage extends StatefulWidget {
  final String movieId;

  const DetailPage({
    required this.movieId,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  String movieId = "";
  MovieResponse? _movieResponse;
  CommentsResponse? _commentsResponse;

  _DetailState();

  @override
  void initState() {
    super.initState();
    movieId = widget.movieId;
  }

  @override
  Widget build(BuildContext context) {
    // 2-1. 상세 화면 (테스트 데이터 설정 - 영화 상세)

    // 2-5. 상세 화면 (테스트 데이터 설정 - 댓글 상세)

    // 2-1. 상세 화면 (조건문에 따라 위젯 다르게 나오도록 하기) - 1
    return Scaffold(
        appBar: AppBar(
          // 2-1. 상세 화면 (제목 설정)
          title: const Text('Detail'),
        ),
        // 2-1. 상세 화면 (전체 화면 세팅1)
        body: const Center(child: Text("Detail Page")));
  }
}

// 2-1. 상세 화면 (전체 화면 세팅2)
class DetailBodyWidget extends StatelessWidget {
  final MovieResponse movieResponse;
  final CommentsResponse? commentsResponse;

  const DetailBodyWidget({
    required this.movieResponse,
    required this.commentsResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // 2-2. Summary 화면 (movieResponse 데이터 추가)
        DetailMovieSummaryWidget(),
        // 2-3. Synopsis 화면 (movieResponse 데이터 추가)
        DetailMovieSynopsisWidget(),
        // 2-4. Cast 화면 (movieResponse 데이터 추가)
        DetailMovieCastWidget(),
        // 2-5. (댓글 입력 창으로 이동을 위해 movieResponse 를 매개변수로 넘겨주기)
        DetailMovieCommentWidget(commentsResponse: commentsResponse),
      ],
    );
  }
}

class DetailMovieSummaryWidget extends StatelessWidget {
  // 2-2. Summary 화면 (데이터 추가)

  const DetailMovieSummaryWidget({
    // 2-2. Summary 화면 (데이터 필수화 및 연결)

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-2. Summary 화면 (화면 구현)
    return const Text("영화 정보");
  }
}

// 2-2. Summary 화면 (1-2 과정)

// 2-2. Summary 화면 (2-2 과정 - 예매율)

// 2-2. Summary 화면 (2-2 과정 - 평점)

// 2-2. Summary 화면 (2-2 과정 - 누적관객수)

// 2-2. Summary 화면 (2-2 과정 - 구분선)

class DetailMovieSynopsisWidget extends StatelessWidget {
  // 2-3. Synopsis 화면 (데이터 추가)

  const DetailMovieSynopsisWidget({
    // 2-3. Synopsis 화면 (데이터 필수화 및 연결)

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-3. Synopsis 화면 (화면 구현)
    return const Text("영화 줄거리");
  }
}

class DetailMovieCastWidget extends StatelessWidget {
  // 2-4. MovieCast 화면 (데이터 추가)

  const DetailMovieCastWidget({
    // 2-4. MovieCast 화면 (데이터 필수화 및 연결)

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-4. MovieCast 화면 (감독 / 출연 구현)
    return const Text("감독/출연");
  }
}

class DetailMovieCommentWidget extends StatelessWidget {
  final CommentsResponse? commentsResponse;
  // 2-5. Comment 화면 (댓글 입력 창으로 이동을 위해 movieResponse 를 매개변수로 받도록 하기)


  const DetailMovieCommentWidget({
    Key? key,
    required this.commentsResponse,
    // 2-5. Comment 화면 (댓글 입력 창으로 이동을 위해 movieResponse 값을 매치시키기)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-5. Comment 화면 (화면 구현)
    return const Text("댓글 화면");
  }
}

// 2-5. Comment 화면 (한줄평 리스트)

// 2-5. Comment 화면 (한줄평 아이템 화면 구축)

// 2-5. Comment 화면 (포맷에 맞춰 날짜 데이터 반환)

// 2-5. Comment 화면 (댓글 입력 창으로 이동)
