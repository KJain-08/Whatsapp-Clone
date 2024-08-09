import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/ButtonCard.dart';
import 'package:untitled1/CustomUI.dart/ContactCard.dart';
import 'package:untitled1/Model/ChatModel.dart';
import 'package:untitled1/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Dev Stack",
              status: "Full Stack Developer"),
      ChatModel(name: "Balram",
              status: "Flutter Developer"),
      ChatModel(name: "Kunal ",
              status: "Confused Developer"),
      ChatModel(name: "Dev Stack",
              status: "Developer"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Select Contacts",style:TextStyle(
              fontSize:19,
              fontWeight: FontWeight.bold
            )),
            Text("256 Contacts",style: TextStyle(
              fontSize: 13
            ),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("Invite a Friend"),
                  value: "Invite a Friend",
                ),
                const PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                const PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
              ];
            },
          ),
        ],
      ),
      body:ListView.builder(
          itemCount: contacts.length+2,
          itemBuilder: (context,index)
          {
            if(index == 0){
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
                },
                child: ButtonCard(name :"New Group", icon : Icons.person));
            }
            else if(index==1){
              return ButtonCard(name : "New Contact",icon : Icons.groups);
            }
          return ContactCard(contact:contacts[index-2]);
          }

      )
    );
  }
}