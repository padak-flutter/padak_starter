import "package:flutter/material.dart";

import 'model/response/comments_response.dart';
import 'model/response/movie_response.dart';

class DetailPage extends StatefulWidget {
  final String movieId;

  DetailPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return _DetailState(movieId);
  }
}

class _DetailState extends State<DetailPage> {
  String movieId;
  String _movieTitle = '';
  MovieResponse _movieResponse;
  CommentsResponse _commentsResponse;

  _DetailState(String movieId){
    this.movieId = movieId;
  }

  @override
  Widget build(BuildContext context) {
    // 2-1. 상세 화면 (테스트 데이터 설정 - 영화 상세)

    // 2-5. 상세 화면 (테스트 데이터 설정 - 댓글 상세)

    return Scaffold(
        appBar: AppBar(
          // 2-1. 상세 화면 (제목 설정)
          title: Text('Detail'),
        ),
        // 2-1. 상세 화면 (전체 화면 세팅1)
        body: Center(child: Text("Detail Page"))
    );
  }

  // 2-1. 상세 화면 (전체 화면 세팅2)

  Widget _buildMovieSummary() {
    // 2-2. Summary 화면 (화면 구현)
    return Text("영화 정보");
  }

  // 2-2. Summary 화면 (1-2 과정)

  // 2-2. Summary 화면 (2-2 과정 - 예매율)

  // 2-2. Summary 화면 (2-2 과정 - 평점)

  // 2-2. Summary 화면 (2-2 과정 - 누적관객수)

  // 2-2. Summary 화면 (2-2 과정 - 구분선)

  Widget _buildMovieSynopsis() {
    // 2-3. Synopsis 화면 (화면 구현)
    return Text("영화 줄거리");
  }
  Widget _buildMovieCast() {
    // 2-4. MovieCast 화면 (감독 / 출연 구현)
    return Text("감독/출연");
  }
  Widget _buildComment() {
    // 2-5. Comment 화면 (화면 구현)
    return Text("댓글 화면");
  }

  // 2-5. Comment 화면 (한줄평 리스트)

  // 2-5. Comment 화면 (한줄평 아이템 화면 구축)

  // 2-5. Comment 화면 (포맷에 맞춰 날짜 데이터 반환)

  // 2-5. Comment 화면 (댓글 입력 창으로 이동)
}