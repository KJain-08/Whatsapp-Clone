class ChatModel
{
  String name ;
  String icon ;
  bool isGroup ;
  String time;
  String currentMsg;
  String newMsg ;
  bool isNewMsg ;
  bool isSelected ;
  late int id;
  String status;
  ChatModel({ required this.name, this.icon="Icons.person", this.currentMsg=" ", this.isGroup= false, this.time = " ", this.newMsg=" ", this.isNewMsg=false,this.status=" ",this.isSelected = false,this.id=0});
}