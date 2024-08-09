import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/Avatar.dart';

import 'package:untitled1/CustomUI.dart/ContactCard.dart';
import 'package:untitled1/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", status: "Full Stack Developer"),
    ChatModel(name: "Balram", status: "Flutter Developer"),
    ChatModel(name: "Kunal ", status: "Confused Developer"),
    ChatModel(name: "Dev Stack", status: "Developer"),
    ChatModel(name: "Dev Stack", status: "Full Stack Developer"),
    ChatModel(name: "Balram", status: "Flutter Developer"),
    ChatModel(name: "Kunal ", status: "Confused Developer"),
    ChatModel(name: "Dev Stack", status: "Developer"),
    ChatModel(name: "Dev Stack", status: "Full Stack Developer"),
    ChatModel(name: "Balram", status: "Flutter Developer"),
    ChatModel(name: "Kunal ", status: "Confused Developer"),
    ChatModel(name: "Dev Stack", status: "Developer"),
  ];
  List<ChatModel> group = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("New Group",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              Text(
                "Add Participants",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
          ],
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context, index) {
                if(index==0){
                  return Container(
                    height:group.length>0?90:10 ,
                  );
                }
                return InkWell(
                    onTap: () {
                      if (contacts[index-1].isSelected == false) {
                        setState(() {
                          contacts[index-1].isSelected = true;
                          group.add(contacts[index-1]);
                        });
                      } else {
                        setState(() {
                          contacts[index-1].isSelected = false;
                          group.remove(contacts[index-1]);
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ContactCard(contact: contacts[index-1]),
                    ));
              }),
          group.length>0?Column(
            children: [
              Container(
                color: Colors.white,
                height: 80,
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    if (contacts[index].isSelected == true) {
                      return InkWell(
                        onTap:(){
                          setState(() {
                            group.remove(contacts[index]);
                            contacts[index].isSelected = false;
                          });
                        } ,
                        child: Avatar(contact: contacts[index]));
                    } else {
                      return Container();
                    }
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // Divider(
              //   thickness: 1,
              // )
            ],
          ):Container(),
        ]));
  }
}
