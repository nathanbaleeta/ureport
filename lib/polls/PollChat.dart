import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ureport_app/polls/ChatBubble.dart';
import 'package:ureport_app/polls/Message.dart';

class PollChat extends StatefulWidget {
  @override
  _PollChatState createState() => _PollChatState();
}

class _PollChatState extends State<PollChat> {
  TextEditingController messageController = new TextEditingController();
  List<Message> messages = List<Message>();
  ScrollController _scrollController = new ScrollController();
  int msgElems = 2;

  @override
  void initState() {
    initHardcodedMessages(); // For testing
    // initMessages();
    print("init State messages: $messages");
    super.initState();
  }

  void initHardcodedMessages() {
    Message bot1 = Message(
        text:
            "How often do you wear a face mask? \n A) Only when I’m talking to someone \n B) Only when I’m asked to wear it \n Reply with either A or B.",
        sender: "bot");
    Message user1 = Message(text: "A", sender: "user");
    Message bot2 = Message(
        text:
            "Thank you for completing our Coronavirus poll. We will update you when more polls come out!",
        sender: "bot");
    messages.add(bot1);
    messages.add(user1);
    messages.add(bot2);
    // updateMessagesStore();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(
          children: [
            Expanded(child: ChatStream()),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Your reply...",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          sendMessage(); // TODO not implemented
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Submit"),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  // List of chat messages
  Widget ChatStream() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          scrollToEnd();
          Message msg = messages[index];
          return ChatBubble(
            message: msg.text,
            sender: msg.sender,
          );
        });
  }

  // Send message
  void sendMessage() {
    String message = messageController.text;
    messageController.text = "";
    setState(() {
      messages.add(Message(text: message, sender: "user"));
    });
    // updateMessagesStore();
    // TODO: backend with rapidpro
  }

  // Scrolls to end of chat
  void scrollToEnd() {
    Timer(
        Duration(milliseconds: 100),
        () => {
              if (_scrollController.hasClients)
                {
                  _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease)
                }
            });
  }

/* void initMessages() async {
    List<String> messagesList = await StoreMessages.getMessages();
    for (int i = 0; i < messagesList.length; i += msgElems) {
      messages.add(Message(text: messagesList[i], sender: messagesList[i + 1]));
    }
  } */

// Tried to use sharedPreferences, not working yet
/* void updateMessagesStore() async {
    List<String> messagesList = List<String>();
    for (int i = 0; i < messages.length; i++) {
      Message msg = messages[i];
      messagesList.add(msg.text);
      messagesList.add(msg.sender);
    }
    // print("Messages List: ${messagesList}");
    bool saved = await StoreMessages.saveMessages(messagesList);
    if (saved) {
      print("saved into sharedpref");
    } else {
      print("!!ERROR!! not saved");
    }
  }*/

}
