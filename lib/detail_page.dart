import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:padak_starter/comment_page.dart';
import 'package:padak_starter/model/data/dummys_repository.dart';

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
    _movieResponse = DummysRepository.loadDummyMovie(movieId);

    // 2-5. 상세 화면 (테스트 데이터 설정 - 댓글 상세)
    _commentsResponse = DummysRepository.loadComments(movieId);

    // 2-1. 상세 화면 (조건문에 따라 위젯 다르게 나오도록 하기) - 1
    if (_movieResponse == null) {
      return const SizedBox();
    } else {
      return Scaffold(
        appBar: AppBar(
          // 2-1. 상세 화면 (제목 설정)
          title: Text(_movieResponse!.title),
        ),
        // 2-1. 상세 화면 (전체 화면 세팅1)
        body: DetailBodyWidget(
          movieResponse: _movieResponse!,
          commentsResponse: _commentsResponse,
        ),
      );
    }
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
        DetailMovieSummaryWidget(movieResponse: movieResponse),
        // 2-3. Synopsis 화면 (movieResponse 데이터 추가)
        DetailMovieSynopsisWidget(movieResponse: movieResponse),
        // 2-4. Cast 화면 (movieResponse 데이터 추가)
        DetailMovieCastWidget(movieResponse: movieResponse),
        // 2-5. (댓글 입력 창으로 이동을 위해 movieResponse 를 매개변수로 넘겨주기)
        DetailMovieCommentWidget(
          commentsResponse: commentsResponse,
          movieResponse: movieResponse,
        ),
      ],
    );
  }
}

class DetailMovieSummaryWidget extends StatelessWidget {
  // 2-2. Summary 화면 (데이터 추가)
  final MovieResponse movieResponse;

  const DetailMovieSummaryWidget({
    // 2-2. Summary 화면 (데이터 필수화 및 연결)
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-2. Summary 화면 (화면 구현)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 영화 포스터와 정보를 보여주는 화면
        Row(
          children: <Widget>[
            Image.network(movieResponse.image, height: 180),
            const SizedBox(width: 10),
            DetailMovieSummaryTextColumnWidget(movieResponse: movieResponse),
          ],
        ),

        const SizedBox(height: 10),

        // 예매율/평점/누적 관객수를 보여주는 화면
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DetailMovieReservationRateWidget(movieResponse: movieResponse),
            const DetailMovieVerticalDividerWidget(),
            DetailMovieUserRatingWidget(movieResponse: movieResponse),
            const DetailMovieVerticalDividerWidget(),
            DetailMovieAudienceWidget(movieResponse: movieResponse),
          ],
        ),
      ],
    );
  }
}

// 2-2. Summary 화면 (1-2 과정)
class DetailMovieSummaryTextColumnWidget extends StatelessWidget {
  // 2-3. Synopsis 화면 (데이터 추가)
  final MovieResponse movieResponse;

  const DetailMovieSummaryTextColumnWidget({
    // 2-3. Synopsis 화면 (데이터 필수화 및 연결)
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movieResponse.title,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          '${movieResponse.date} 개봉',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '${movieResponse.genre} / ${movieResponse.duration}분',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

// 2-2. Summary 화면 (2-2 과정 - 예매율)
class DetailMovieReservationRateWidget extends StatelessWidget {
  final MovieResponse movieResponse;

  const DetailMovieReservationRateWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              '예매율',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${movieResponse.reservationGrade}위 ${movieResponse.reservationRate.toString()}%',
            ),
          ],
        ),
      ],
    );
  }
}

// 2-2. Summary 화면 (2-2 과정 - 평점)
class DetailMovieUserRatingWidget extends StatelessWidget {
  final MovieResponse movieResponse;

  const DetailMovieUserRatingWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          '평점',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text("${movieResponse.userRating / 2}"),
      ],
    );
  }
}

// 2-2. Summary 화면 (2-2 과정 - 누적관객수)
class DetailMovieAudienceWidget extends StatelessWidget {
  final MovieResponse movieResponse;

  const DetailMovieAudienceWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat.decimalPattern();
    return Column(
      children: <Widget>[
        const Text(
          '누적관객수',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(numberFormatter.format(movieResponse.audience)),
      ],
    );
  }
}

// 2-2. Summary 화면 (2-2 과정 - 구분선)
class DetailMovieVerticalDividerWidget extends StatelessWidget {
  const DetailMovieVerticalDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1,
      height: 50,
      child: ColoredBox(
        color: Colors.grey,
      ),
    );
  }
}

class DetailMovieSynopsisWidget extends StatelessWidget {
  // 2-3. Synopsis 화면 (데이터 추가)
  final MovieResponse movieResponse;

  const DetailMovieSynopsisWidget({
    // 2-3. Synopsis 화면 (데이터 필수화 및 연결)
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-3. Synopsis 화면 (화면 구현)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            '줄거리',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Text(movieResponse.synopsis),
        ),
      ],
    );
  }
}

class DetailMovieCastWidget extends StatelessWidget {
  // 2-4. MovieCast 화면 (데이터 추가)
  final MovieResponse movieResponse;

  const DetailMovieCastWidget({
    // 2-4. MovieCast 화면 (데이터 필수화 및 연결)
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-4. MovieCast 화면 (감독 / 출연 구현)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            '감독/출연',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    '감독',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(movieResponse.director),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const Text(
                    '출연',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(movieResponse.actor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailMovieCommentWidget extends StatelessWidget {
  final CommentsResponse? commentsResponse;
  // 2-5. Comment 화면 (댓글 입력 창으로 이동을 위해 movieResponse 를 매개변수로 받도록 하기)
  final MovieResponse movieResponse;

  const DetailMovieCommentWidget({
    Key? key,
    required this.commentsResponse,
    // 2-5. Comment 화면 (댓글 입력 창으로 이동을 위해 movieResponse 값을 매치시키기)
    required this.movieResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2-5. Comment 화면 (화면 구현)
    if (commentsResponse != null && commentsResponse!.comments.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 10,
            color: Colors.grey.shade400,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '한줄평',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.create),
                  color: Colors.blue,
                  onPressed: () => _presentCommentPage(context, movieResponse),
                )
              ],
            ),
          ),
          DetailMovieCommentListWidget(commentsResponse: commentsResponse),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

// 2-5. Comment 화면 (한줄평 리스트)
class DetailMovieCommentListWidget extends StatelessWidget {
  final CommentsResponse? commentsResponse;

  const DetailMovieCommentListWidget({
    Key? key,
    required this.commentsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (commentsResponse != null && commentsResponse!.comments.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(10.0),
        itemCount: commentsResponse!.comments.length,
        itemBuilder: (_, index) => DetailMovieCommentItemWidget(
          comment: commentsResponse!.comments[index],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

// 2-5. Comment 화면 (한줄평 아이템 화면 구축)
class DetailMovieCommentItemWidget extends StatelessWidget {
  final Comment comment;

  const DetailMovieCommentItemWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(
            Icons.person_pin,
            size: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(comment.writer),
                  // 추후 custom StarRatingBar Widget 적용
                  const SizedBox(width: 5)
                ],
              ),
              Text(_convertTimeStampToDataTime(comment.timestamp)),
              const SizedBox(height: 5),
              Text(comment.contents)
            ],
          )
        ],
      ),
    );
  }
}

// 2-5. Comment 화면 (포맷에 맞춰 날짜 데이터 반환)
String _convertTimeStampToDataTime(int timestamp) {
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  return dateFormatter
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
}

// 2-5. Comment 화면 (댓글 입력 창으로 이동)
void _presentCommentPage(BuildContext context, MovieResponse movieResponse) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CommentPage(
        movieTitle: movieResponse.title,
        movieId: movieResponse.id,
      ),
    ),
  );
}
