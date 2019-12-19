import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterchat/models/message_model.dart';
import 'package:flutterchat/models/user_model.dart';

class MessageChat extends StatefulWidget {
  final User user;

  MessageChat({this.user});

  @override
  _MessageChatState createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  _builderMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 80.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo,
              color: Color(0xFF4BB27C),
            ),
            iconSize: 25.0,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(hintText: "Send a message"),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Color(0xFF4BB27C),
            ),
            iconSize: 25.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          //自己构建一个返回按钮
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.user.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Montserrat",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return Row(
                      children: <Widget>[
                        isMe
                            ? SizedBox(
                                width: 0.5,
                              )
                            : Expanded(
                                // flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 45.0,
                                      width: 45.0,
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
                                        ],

                                        color: Color(0xffa3a3a3), //底色
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image(
                                          image: AssetImage(
                                              message.sender.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text(
                              //   message.sender.name,
                              // ),
                              Container(
                                margin: isMe
                                    ? EdgeInsets.only(
                                        top: 15.0, bottom: 8.0, left: 80.0)
                                    : EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 8.0,
                                        // left: 80.0,
                                      ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.0,
                                  vertical: 10.0,
                                ),
                                // width: MediaQuery.of(context).size.width * 0.80,
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? Color(0xFF4BB27C)
                                      : Color(0xffd3d3d3),
                                  borderRadius: isMe
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                          bottomLeft: Radius.circular(25.0))
                                      : BorderRadius.only(
                                          topRight: Radius.circular(25.0),
                                          bottomLeft: Radius.circular(25.0),
                                          bottomRight: Radius.circular(25.0),
                                        ),
                                ),
                                child: Text(
                                  message.text,
                                  style: TextStyle(
                                    color: isMe ? Colors.white : Colors.black87,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        isMe
                            ? Expanded(
                                // flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 45.0,
                                      width: 45.0,
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
                                        ],

                                        color: Color(0xffa3a3a3), //底色
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image(
                                          image: AssetImage(
                                              message.sender.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 0.5,
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
            _builderMessageComposer(),
          ],
        ),
      ),
    );
  }
}
