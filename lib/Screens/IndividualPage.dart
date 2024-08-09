
import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/OwnMsg.dart';
import 'package:untitled1/CustomUI.dart/Reply.dart';
import 'package:untitled1/Model/ChatModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:untitled1/Model/MessageMode.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel,required this.sourcechat });
  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _controller = TextEditingController();
  late IO.Socket socket ;
  bool sendButton = false;
  List<MessageModel> messages = [];
  ScrollController _scrollController = ScrollController();

  
  @override
  void initState(){
    super.initState();
    connect();
  }


 void connect() {
    socket = IO.io("http://192.168.56.1:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("/SignIn",widget.sourcechat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message",(msg){
        print(msg);
      setMessage("destination", msg["message"]);
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);
      });
      },);
    print(socket.connected);
  }

  void sendMessage(String message,int sourceid,int targetid){
    setMessage("source", message);
    socket.emit("message",{"message":message,"sourceid":sourceid,"targetid":targetid});
  }

  void setMessage(String type,String message){
      MessageModel messageModel = MessageModel(message: message, type: type,time:DateTime.now().toString().substring(10,16));
      setState(() {
        setState(() {
          messages.add(messageModel);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 179, 147),
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back, size: 25),
              CircleAvatar(
                child: Icon(
                  widget.chatModel.isGroup ? Icons.groups : Icons.person,
                  size: 32,
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(166, 166, 163, 163),
              ),
            ],
          ),
        ),
        title: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.5,
                ),
              ),
              const Text(
                "Last Seen Today at 11:45pm",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFE7E1E1),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                const PopupMenuItem(
                  child: Text("Media, Links & Docs"),
                  value: "Media, Links & Docs",
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length+1,
                itemBuilder: (context,index){
                  if (index==messages.length){
                    return Container(height: 70,);
                  }
                  if(messages[index].type == "source")
                  {
                    return OwnMsg(message:messages[index].message,
                    time:messages[index].time);
                  }
                  else{
                    return Reply(message :messages[index].message,
                    time:messages[index].time);
                  }
                },
                shrinkWrap: true,
                controller: _scrollController,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              onChanged:(value){
                                setState(() {
                                if(value.length>0){
                                  _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeOut);
                                  sendButton = true;
                                }
                                else{
                                  sendButton = false;
                                }
                          });
                                
                              } ,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.emoji_emotions_outlined),
                                  onPressed: (){},
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context, builder: (builder)=>bottomSheet());
                                      },
                                      icon: const Icon(Icons.attachment),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: IconButton(
                            icon: Icon(
                              sendButton?Icons.send:Icons.mic,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if(sendButton){
                                sendMessage(_controller.text, widget.sourcechat.id, widget.chatModel.id);
                                _controller.clear();
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                        
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon,Color background,String text){
    return InkWell(
      onTap:(){} ,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: background,
            child: IconButton(onPressed:(){} 
            , icon: Icon(icon,size: 29,color: Colors.white,)),
          ),
          Padding(padding: EdgeInsets.only(top:5),),
          Text(text,style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),)
        ],
      ),
    );
  }

  Widget bottomSheet()
  {
    return Container(
    height : 278,
    width :MediaQuery.of(context).size.width,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconCreation(Icons.insert_drive_file,Colors.indigo,"Document"),
              iconCreation(Icons.camera_alt,Colors.pink,"Camera"),
              iconCreation(Icons.insert_photo,Colors.purple,"Insert Photo")
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconCreation(Icons.audiotrack,Colors.orange,"Audio"),
              iconCreation(Icons.location_pin,Colors.teal,"Location"),
              iconCreation(Icons.person,Colors.blue,"Camera"),
              ],
          )
        ],
      ),
    ) ,

    );

  }
}