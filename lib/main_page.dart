import "package:flutter/material.dart";

// 1-2. 탭 화면 (각 화면 import)
import 'grid_page.dart';
import 'list_page.dart';

// 1-2. 탭 화면 (Stateless -> Stateful)
class MainPage extends StatefulWidget {
  // 1-2. 탭 화면 (_selectedTabIndex 변수 옮김)

  // 1-2. 탭 화면 (createState 함수 추가)
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

// 1-2. 탭 화면 (State 구현)
class _MainPageState extends State<MainPage>{
  // 1-2. 탭 화면 (탭 인덱스 설정)
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1-1. 상단화면 (제목 수정)
        title: const Text('Flutter'),
        // 1-1. 상단화면 (좌측 버튼 추가)
        // leading: const Icon(Icons.menu),

        // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.sort),
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
      // 1-2. 탭 화면 (List, Grid Widget 연동)
      body: _selectedTabIndex == 0 ? ListPage() : GridPage(),
      // 1-2. 탭 화면 (bottomNavigationBar 추가)
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
