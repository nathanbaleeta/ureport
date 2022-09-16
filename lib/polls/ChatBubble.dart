import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  String message;
  String sender; // either "bot" or "user"
  ChatBubble({@required this.message, @required this.sender});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool sentByMe = false;

  @override
  void initState() {
    if (widget.sender == "user") {
      sentByMe = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
      child: Align(
        alignment: (sentByMe ? Alignment.topRight : Alignment.topLeft),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (sentByMe
                ? Theme.of(context).accentColor
                : Colors.grey.shade200),
          ),
          padding: EdgeInsets.all(16),
          child: Text(widget.message),
        ),
      ),
    );
  }
}
