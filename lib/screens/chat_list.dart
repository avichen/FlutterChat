import 'package:flutter/material.dart';
import 'package:flutterchat/screens/list_page.dart';


class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Chatting",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Color(0xffa3a3a3),
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Color(0xffa3a3a3),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            color: Color(0xffa3a3a3),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListPage(),
            // MessageChat(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Color(0xffa3a3a3),
            ),
            title: Text(
              'Message',
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Color(0xffa3a3a3),
            ),
            title: Text(
              'Feed',
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam,
              color: Color(0xffa3a3a3),
            ),
            title: Text(
              'Video',
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: Color(0xffa3a3a3),
            ),
            title: Text(
              'Call',
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: Color(0xffa3a3a3),
            ),
            title: Text(
              'Account',
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    print(index);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => HomePage(),
    //     ));
    setState(() {
      _selectedIndex = index;
    });
  }
}
