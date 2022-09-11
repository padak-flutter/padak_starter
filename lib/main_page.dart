import "package:flutter/material.dart";

import 'grid_page.dart';
import 'list_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),

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
      body: _selectedTabIndex == 0 ? ListPage() : GridPage(),
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
