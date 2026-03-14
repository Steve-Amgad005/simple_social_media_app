import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  String img;
  Avatar({super.key,required this.img});
  @override
  Widget build(BuildContext context){
    return CircleAvatar(
      radius: 28,
      backgroundImage: AssetImage("images/mypic.jpg"),
    );
  }


}