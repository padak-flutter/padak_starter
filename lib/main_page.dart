import "package:flutter/material.dart";

// 1-2. 탭 화면 (각 화면 import)

// 1-2. 탭 화면 (Stateless -> Stateful)
class MainPage extends StatelessWidget {
  // 1-2. 탭 화면 (_selectedTabIndex 변수 옮김)
  // 1-2. 탭 화면 (탭 인덱스 설정)

  // 1-2. 탭 화면 (createState 함수 추가)

  // 1-2. 탭 화면 (build() 함수를 _MainState로 옮김)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1-1. 상단화면 (제목 수정)
        title: Text('Flutter'),
        // 1-1. 상단화면 (좌측 버튼 추가)

        // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)

      ),
      // 1-2. 탭 화면 (List, Grid Widget 연동)
      body: Center(child: Text("Hello Flutter")),
      // 1-2. 탭 화면 (bottomNavigationBar 추가)
    );
  }
}

// 1-2. 탭 화면 (State 구현)

// 1-2. 탭 화면 (List, Grid Widget 반환)