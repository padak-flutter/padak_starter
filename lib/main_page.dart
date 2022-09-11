import "package:flutter/material.dart";
import 'package:padak_starter/dataSource/movie_data_source.dart';
import 'package:padak_starter/model/response/movies_response.dart';

import 'grid_page.dart';
import 'list_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;

  // 4-1. 메인화면 - 서버로부터 받아올 영화 목록 데이터 변수 선언
  List<Movie> movies = <Movie>[];

  // 4-2. 메인화면 - initState() 에서 영화 목록을 가져옵니다.
  @override
  void initState() {
    super.initState();
    MovieDataSource.requestMovies(0).then((response) {
      setState(() {
        movies = response;
      });
    }).catchError((error) {
      const snackBar = SnackBar(
        content: Text('API 오류가 발생했습니다. 잠시 후 다시 시도해주세요.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        movies = [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.sort),
            // 4-2. 메인화면 - value 에 따라 영화 목록 요청을 진행
            onSelected: (value) async {
              movies = await MovieDataSource.requestMovies(value);
              setState(() {});
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text("예매율순"),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text("큐레이션"),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("최신순"),
                ),
              ];
            },
          )
        ],
      ),
      body: _selectedTabIndex == 0
          // 4-2. 메인화면 - ListPage 에 영화 목록을 넘김
          ? ListPage(movies: movies)
          // 4-2. 메인화면 - GridPage 에 영화 목록을 넘김
          : GridPage(movies: movies),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Grid',
          ),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          // 1-2. 탭 화면 (setState() 설정)
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex Tab Clicked");
          });
        },
      ),
    );
  }
}
