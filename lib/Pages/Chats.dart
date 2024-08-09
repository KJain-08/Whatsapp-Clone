import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/CustomCard.dart';
import 'package:untitled1/Model/ChatModel.dart';
import 'package:untitled1/Screens/SelectContacts.dart';

class Chats extends StatefulWidget {
  const Chats({super.key,required this.chatModel,required this.sourcechat});
  final List<ChatModel> chatModel;
  final ChatModel sourcechat;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (builder)=>SelectContact()));
        },
        child: Icon(Icons.chat,color: Colors.white, ),
      ),
      body: ListView.builder(
        itemCount:widget.chatModel.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel : widget.chatModel[index],
          sourcechat: widget.sourcechat,
          ),
      ),
      );
  }
}