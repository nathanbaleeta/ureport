import 'package:flutter/cupertino.dart';

class Message {
  String text;
  String sender; // "bot" or "user"

  Message({@required String text, @required String sender}) {
    this.text = text;
    this.sender = sender;
  }
}
