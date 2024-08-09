import "package:flutter/material.dart";
import "package:untitled1/Model/ChatModel.dart";
import "package:untitled1/Pages/CameraPage.dart";
import "package:untitled1/Pages/Chats.dart";
import "package:untitled1/Pages/StatusPage.dart";

class homepage extends StatefulWidget {
  const homepage({super.key,required this.chatModel,required this.sourcechat});
  final List<ChatModel> chatModel;
  final ChatModel sourcechat;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin {
  @override
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length:4 , vsync: this,initialIndex: 1);
  } 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions :[
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            }
            ,itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text("New Group"),value: "New Group"),
              PopupMenuItem(child: Text("New Broadcast"),value: "New Broadcast"),
              PopupMenuItem(child: Text("Whatsapp Web"),value: "Whatsapp Web"),
              PopupMenuItem(child: Text("Starred Message"),value: "Starred Message"),
              PopupMenuItem(child: Text("Settings"),value: "Settings")
            ];
          }
          ),
        ],
        bottom: TabBar(controller: _controller,
        indicatorColor: Colors.white,
        tabs: [
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(text: "CHATS",),
          Tab(text: "STATUS",),
          Tab(text: "CALLS",),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children:[
        Text("Camera"),
        Chats(
          chatModel: widget.chatModel,
          sourcechat: widget.sourcechat
        ,),
        StatusPage(),
        Text("Call")],
      
      ),
    );
  }
}

