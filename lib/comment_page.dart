import "package:flutter/material.dart";
import 'package:padak_starter/model/widget/star_rating_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('한줄평 작성'),
        actions: <Widget>[
          CommentSubmitButtonWidget(
            // 6-1. 한줄평 입력 화면 - movieId 매개변수 입력

            ratingController: ratingController,
            writerController: writerController,
            contentsController: contentsController,
          ),
        ],
      ),
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommentMovieTitleWidget(movieTitle: movieTitle),
                CommentUserRatingWidget(ratingController: ratingController),
                const CommentHorizontalDividerWidget(),
                CommentNicknameInputFormWidget(
                  writerController: writerController,
                ),
                CommentCommentInputFormWidget(
                  contentsController: contentsController,
                )
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
      ),
    );
  }
}

class CommentSubmitButtonWidget extends StatelessWidget {
  // 6-1. 한줄평 입력 화면 - movieId 매개변수로 등록

  final ValueNotifier<double> ratingController;
  final TextEditingController writerController;
  final TextEditingController contentsController;

  const CommentSubmitButtonWidget({
    Key? key,
    // 6-1. 한줄평 입력 화면 - movieId 주입

    required this.ratingController,
    required this.writerController,
    required this.contentsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sendIcon = Icon(
      Icons.send,
      color: Colors.white,
      size: 25,
    );

    return IconButton(
      icon: sendIcon,
      onPressed: () {
        if (writerController.text.isEmpty || contentsController.text.isEmpty) {
          _showSnackBar(context, '모든 정보를 입력해주세요.');
        } else {
          print("writer : ${writerController.text}");
          print("contents : ${contentsController.text}");
          print("rating : ${ratingController.value}");
          // 6-1. 한줄평 입력 화면 - 4. 한줄평 목록 API 요청
          Navigator.of(context).pop(true);
        }
      },
    );
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        movieTitle,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
    return Column(
      children: <Widget>[
        StarRatingBar(
          onRatingChanged: (rating) {
            setState(() {
              widget.ratingController.value = (rating / 2).toDouble();
            });
          },
        ),
        Text((widget.ratingController.value).toString())
      ],
    );
  }
}

class CommentHorizontalDividerWidget extends StatelessWidget {
  const CommentHorizontalDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
      width: double.infinity,
      height: 10,
      color: Colors.grey.shade400,
    );
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: widget.writerController,
        maxLines: 1,
        maxLength: 20,
        decoration: InputDecoration(
          hintText: '닉네임을 입력해주세요',
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
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
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      child: TextField(
        controller: widget.contentsController,
        maxLines: null,
        maxLength: 100,
        decoration: InputDecoration(
          hintText: '한줄평을 작성해주세요',
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
