import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:padak_starter/comment_page.dart';
import 'package:padak_starter/dataSource/movie_data_source.dart';
import 'package:padak_starter/model/data/dummys_repository.dart';
import 'package:padak_starter/model/widget/star_rating_bar.dart';

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

    // 5-1. 상세화면 - initState() 에서 영화 상세 데이터를 가져옵니다.
    MovieDataSource.requestMovie(movieId).then((response) {
      setState(() {
        _movieResponse = response;
      });
    }).catchError((error) {
      const snackBar = SnackBar(
        content: Text('API 오류가 발생했습니다. 불편을 막기 위해 더미 데이터를 띄웁니다.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        _movieResponse = DummysRepository.loadDummyMovie(movieId);
      });
    });

    // 5-2. 상세화면 - initState() 에서 영화 한줄평 목록을 가져옵니다.
    MovieDataSource.requestComments(movieId).then((response) {
      setState(() {
        _commentsResponse = response;
      });
    }).catchError((error) {
      const snackBar = SnackBar(
        content: Text('API 오류가 발생했습니다. 댓글을 띄우지 않습니다.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        _commentsResponse = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 5-2. 상세화면 - 한줄평 목록 더미 삭제

    if (_movieResponse == null) {
      // 5-1. 상세화면 - 데이터를 받아오고 있을 때는 CircleProgressBar 를 띄워줌
      return const ColoredBox(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(_movieResponse!.title),
        ),
        body: DetailBodyWidget(
          movieResponse: _movieResponse!,
          commentsResponse: _commentsResponse,
        ),
      );
    }
  }
}

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
        DetailMovieSummaryWidget(movieResponse: movieResponse),
        DetailMovieSynopsisWidget(movieResponse: movieResponse),
        DetailMovieCastWidget(movieResponse: movieResponse),
        DetailMovieCommentWidget(
          commentsResponse: commentsResponse,
          movieResponse: movieResponse,
        ),
      ],
    );
  }
}

class DetailMovieSummaryWidget extends StatelessWidget {
  final MovieResponse movieResponse;

  const DetailMovieSummaryWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(movieResponse.image, height: 180),
            const SizedBox(width: 10),
            DetailMovieSummaryTextColumnWidget(movieResponse: movieResponse),
          ],
        ),
        const SizedBox(height: 10),
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

class DetailMovieSummaryTextColumnWidget extends StatelessWidget {
  final MovieResponse movieResponse;

  const DetailMovieSummaryTextColumnWidget({
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
  final MovieResponse movieResponse;

  const DetailMovieSynopsisWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  final MovieResponse movieResponse;

  const DetailMovieCastWidget({
    required this.movieResponse,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  final MovieResponse movieResponse;

  const DetailMovieCommentWidget({
    Key? key,
    required this.commentsResponse,
    required this.movieResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(width: 5),
                  StarRatingBar(
                    onRatingChanged: (value) {},
                    rating: comment.rating.toInt(),
                    isUserInteractionEnabled: false,
                    size: 20,
                  ),
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

String _convertTimeStampToDataTime(int timestamp) {
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  return dateFormatter
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
}

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
