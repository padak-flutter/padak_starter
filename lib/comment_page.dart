import "package:flutter/material.dart";

class CommentPage extends StatefulWidget {
  final String movieTitle;
  final String movieId;

  CommentPage(this.movieTitle, this.movieId);

  @override
  CommentPageState createState() => CommentPageState(movieTitle, movieId);
}

class CommentPageState extends State<CommentPage> {
  String movieTitle;
  String movieId;

  final scaffoldState = GlobalKey<ScaffoldState>();
  int _rating = 0;
  String _writer = "";
  String _contents = "";

  CommentPageState(String movieTitle, String movieId){
    this.movieTitle = movieTitle;
    this.movieId = movieId;
  }

  // 3-1. 댓글 입력 화면 (화면 구현)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('한줄평 작성'),
        ),
        body: Center(child: Text("Comment Page"))
    );
  }

  Widget _buildSubmitButton(){
    // 3-2. 댓글 입력 화면 (_buildSubmitButton)
    return Center(child: Text("전송"));
  }

  Widget _buildMovieTitle(){
    // 3-3. 댓글 입력 화면 (_buildMovieTitle)
    return Text("영화 제목");
  }

  Widget _buildUserRating(){
    // 3-4. 댓글 입력 화면 (_buildUserRating)
    return Text("유저가 별점을 설정할 수 있는 화면");
  }

  Widget _buildHorizontalDivider(){
    // 3-5. 댓글 입력 화면 (_buildHorizontalDivider)
    return Text("회색 구분선 화면");
  }

  Widget _buildNickNameInputForm(){
    // 3-6. 댓글 입력 화면 (_buildNickNameInputForm)
    return Text("닉네임 입력");
  }

  Widget _buildCommentInputForm(){
    // 3-7. 댓글 입력 화면 (_buildCommentInputForm)
    return Text("한줄평 입력");
  }

  void _showSnackBar(String text) {
    final snackBar = SnackBar(content: Text(text));
    scaffoldState.currentState.showSnackBar(snackBar);
  }
}