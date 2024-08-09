import 'package:flutter/material.dart';
import 'package:untitled1/Model/ChatModel.dart';
import 'package:untitled1/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.chatModel,required this.sourcechat});
  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>IndividualPage(chatModel:chatModel ,sourcechat:sourcechat)));
      },
      child : ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: Icon(chatModel.isGroup?Icons.groups:Icons.person),
        backgroundColor: Color.fromARGB(255, 103, 103, 103),
        foregroundColor: Colors.white,
      ),
      title: Text(chatModel.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          Text(chatModel.currentMsg,style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          chatModel.isNewMsg?CircleAvatar(
            radius: 10,
            child: Text(chatModel.newMsg,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.blue,
          ):Text(""),
          Text(chatModel.time,style: TextStyle(color: Colors.grey),)
        ],
      )
    ),
    );  
    }
}