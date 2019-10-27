import "package:flutter/material.dart";

import 'grid_page.dart';
import 'list_page.dart';

// 1-2. 탭 화면 (Stateless -> Stateful)
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // 1-2. 탭 화면 (State 반환)
    return _MainState();
  }
}

// 1-2. 탭 화면 (State 구현)
class _MainState extends State<MainPage>{
  // 1-2. 탭 화면 (currentIndex 변수 선언)
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 1-1. 상단화면 (제목 수정)
          title: Text('Movie'),
          // 1-1. 상단화면 (좌, 우측 버튼 추가)
          // leading: Icon(Icons.menu),
          // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)
          actions: <Widget>[
            PopupMenuButton<int>(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                if (value == 0)
                  print("예매율순");
                else if (value == 1)
                  print("큐레이션");
                else
                  print("최신순");
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 0, child: Text("예매율순")),
                  PopupMenuItem(value: 1, child: Text("큐레이션")),
                  PopupMenuItem(value: 2, child: Text("최신순"))
                ];
              },
            )
          ],
        ),
        // 1-2. 탭 화면 (List, Grid Widget 연동)
        body: _buildPage(),
        // 1-2. 탭 화면 (bottomNavigationBar 추가)
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_on),
              title: Text('Grid'),
            ),
          ],
          // 1-2. 탭 화면 (currentIndex 변수 연결)
          currentIndex: _selectedTabIndex,
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
              print("$_selectedTabIndex Tab Clicked");
            });
          },
        ));
  }

  // 1-2. 탭 화면 (List, Grid Widget 반환)
  Widget _buildPage(){
    if(_selectedTabIndex == 0)
      return ListPage();
    else
      return GridPage();
  }
}