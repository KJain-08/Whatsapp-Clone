import 'package:flutter/material.dart';
import 'package:untitled1/Model/ChatModel.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            CircleAvatar(
              radius: 23,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(Icons.clear, color: Colors.white, size: 10)),
            ),
          ]),
          SizedBox(
            height: 2,
          ),
          Text(contact.name,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
