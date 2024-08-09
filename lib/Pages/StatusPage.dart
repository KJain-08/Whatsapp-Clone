import 'package:flutter/material.dart';
import 'package:untitled1/CustomUI.dart/StatusPage/OtherStatus.dart';
import 'package:untitled1/CustomUI.dart/StatusPage/OwnStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){},
            backgroundColor:Colors.grey[400],
            child: Icon(Icons.edit,color: Colors.black,size:30),
            ),
            SizedBox(
              height: 15,
            ),
           FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.camera_alt,color: Colors.white,size:30),
        ),
        ],
      ),
      body: Column(
        children: [
          OwnStatus(),
          Container(
            margin: EdgeInsets.symmetric(vertical:5),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            color: Colors.grey[500],
            height: 28,
            width: MediaQuery.of(context).size.width,
            child: Text("Recent Status",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          OtherStatus(),
          OtherStatus(),
          OtherStatus(),
        ],
      ),
    );
  }
}