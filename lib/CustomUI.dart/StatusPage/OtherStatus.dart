import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: Stack(children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person,size:35,color: Colors.grey[200],),
          ),
        ]),
        title: Text("NAME",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}