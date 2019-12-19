import 'package:flutter/material.dart';
import 'package:flutterchat/models/message_model.dart';

import 'message_chat.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
        ),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final chat = chats[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,//空白区域也可点击
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MessageChat(user: chat.sender,),)),
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 10.0),
                // decoration: BoxDecoration(
                //   border: Border(bottom: BorderSide(width: 1.0,color: Colors.red))
                // ),
                margin: EdgeInsets.only(
                    top: 15.0, bottom: 10.0, left: 10.0, right: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      //   child: CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: 35.0,
                      //   backgroundImage:
                      //       AssetImage(chat.sender.imageUrl),
                      // ),
                      child: Container(
                        // margin: EdgeInsets.only(left: 10.0),
                        // width: 72,
                        // height: 72,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ), // 边色与边宽度
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffa3a3a3),
                                  offset: Offset(1.0, 5.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0),
                              // BoxShadow(
                              //     color: Color(0x9900FF00),
                              //     offset: Offset(1.0, 1.0)),
                              // BoxShadow(color: Colors.white),
                            ],

                            color: Color(0xffa3a3a3), //底色
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage(chat.sender.imageUrl),
                            //   // fit: BoxFit.cover,
                            // ),
                          ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(chat.sender.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width * 0.55,
                            child: Text(
                              chat.text,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                              ),
                              // softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(
                            chat.time,
                            style: TextStyle(fontSize: 10.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
