import 'package:flutter/material.dart';

class OwnStatus extends StatelessWidget {
  const OwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: Stack(children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[700],
            child: Icon(Icons.person,size:35,color: Colors.white,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.teal[800],
              child: Icon(Icons.add,
              color: Colors.white,size: 14,),
              )
            )
        ]),
        title: Text("YOUR STATUS",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        subtitle: Text("Click here to add your status",style: TextStyle(
          color:Colors.grey[600],
          fontSize: 15,
          fontWeight: FontWeight.w600),),
      ),
    );
  }
}