import "package:flutter/material.dart";

class CommentPage extends StatefulWidget {
  final String movieTitle;
  final String movieId;

  const CommentPage({
    required this.movieTitle,
    required this.movieId,
    super.key,
  });

  @override
  CommentPageState createState() => CommentPageState();
}

class CommentPageState extends State<CommentPage> {
  String movieTitle = "";
  String movieId = "";

  ValueNotifier<double> ratingController = ValueNotifier<double>(0.0);
  TextEditingController writerController = TextEditingController();
  TextEditingController contentsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    movieTitle = widget.movieTitle;
    movieId = widget.movieId;
  }

  @override
  void dispose() {
    ratingController.dispose();
    writerController.dispose();
    contentsController.dispose();
    super.dispose();
  }

  // 3-1. 댓글 입력 화면 (화면 구현)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('한줄평 작성'),
        ),
        body: Center(child: Text("Comment Page")));
  }
}

class CommentSubmitButtonWidget extends StatelessWidget {
  final ValueNotifier<double> ratingController;
  final TextEditingController writerController;
  final TextEditingController contentsController;

  const CommentSubmitButtonWidget({
    Key? key,
    required this.ratingController,
    required this.writerController,
    required this.contentsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3-2. 댓글 입력 화면 (CommentSubmitButtonWidget)
    return const Center(child: Text("전송"));
  }
}

class CommentMovieTitleWidget extends StatelessWidget {
  final String movieTitle;

  const CommentMovieTitleWidget({
    required this.movieTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3-3. 댓글 입력 화면 (CommentMovieTitleWidget)
    return const Text("영화 제목");
  }
}

class CommentUserRatingWidget extends StatefulWidget {
  final ValueNotifier<double> ratingController;

  const CommentUserRatingWidget({
    Key? key,
    required this.ratingController,
  }) : super(key: key);

  @override
  State<CommentUserRatingWidget> createState() =>
      _CommentUserRatingWidgetState();
}

class _CommentUserRatingWidgetState extends State<CommentUserRatingWidget> {
  @override
  Widget build(BuildContext context) {
    // 3-4. 댓글 입력 화면 (CommentUserRatingWidget)
    return const Text("유저가 별점을 설정할 수 있는 화면");
  }
}

class CommentHorizontalDividerWidget extends StatelessWidget {
  const CommentHorizontalDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3-5. 댓글 입력 화면 (CommentHorizontalDividerWidget)
    return const Text("회색 구분선 화면");
  }
}

class CommentNicknameInputFormWidget extends StatefulWidget {
  final TextEditingController writerController;

  const CommentNicknameInputFormWidget({
    required this.writerController,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentNicknameInputFormWidget> createState() =>
      _CommentNicknameInputFormWidgetState();
}

class _CommentNicknameInputFormWidgetState
    extends State<CommentNicknameInputFormWidget> {
  @override
  Widget build(BuildContext context) {
    // 3-6. 댓글 입력 화면 (CommentNicknameInputFormWidget)
    return const Text("닉네임 입력");
  }
}

class CommentCommentInputFormWidget extends StatefulWidget {
  final TextEditingController contentsController;

  const CommentCommentInputFormWidget({
    required this.contentsController,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentCommentInputFormWidget> createState() =>
      _CommentCommentInputFormWidgetState();
}

class _CommentCommentInputFormWidgetState
    extends State<CommentCommentInputFormWidget> {
  @override
  Widget build(BuildContext context) {
    // 3-7. 댓글 입력 화면 (CommentCommentInputFormWidget)
    return const Text("한줄평 입력");
  }
}

void _showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
