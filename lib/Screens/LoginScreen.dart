import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/ButtonCard.dart';
import 'package:untitled1/Model/ChatModel.dart';
import 'package:untitled1/Screens/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    late ChatModel sourcechat;
    List<ChatModel> chatmodels = [
    ChatModel(
      name:"Kunal",
      isGroup : false,
      currentMsg : "Hello Kunal",
      time : "4:00",
      icon : "group",
      newMsg: "5",
      isNewMsg: true,
      id:1
      ),
    ChatModel(
      name:"Jain",
      isGroup : false,
      currentMsg : "Hello JAin",
      time : "10:00",
      icon : "person",
      newMsg: "15",
      isNewMsg: true,
      id:2,
      ),
    ChatModel(
      name:"ABC",
      isGroup : false,
      currentMsg : "Hello JAin",
      time : "10:00",
      icon : "person",
      newMsg: "0",      
      isNewMsg: false,
      id:3,
      ),
    ChatModel(
      name:"Jain",
      isGroup : false,
      currentMsg : "Hello JAin",
      time : "10:00",
      icon : "person",
      newMsg: "5",
      isNewMsg: true,
      id:4,
      ),

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (context,index)=>
         InkWell(
          onTap: () {
            sourcechat = chatmodels.removeAt(index);
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder:(builder)=>homepage(
              chatModel: chatmodels,
              sourcechat: sourcechat,
            )));
          },
          child: ButtonCard(name:chatmodels[index].name,icon:Icons.person))
      )
    );
  }
}