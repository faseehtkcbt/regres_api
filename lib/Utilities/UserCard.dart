import 'package:flutter/material.dart';
import 'package:untitled/Model/datamodel.dart';

Widget UserCard(BuildContext context,List <Data> data){
  return ListView.separated(
    itemBuilder:(context, index) {
     final user=data[index];
    return Card(
      child: ListTile(
        title:Text(user.firstName ?? "",style: const TextStyle(fontSize: 16,color: Colors.white),),
        subtitle:Text(user.lastName ?? "",style: const TextStyle(fontSize: 16,color: Colors.white),),
        leading: CircleAvatar(
          radius: 20,
          backgroundImage:NetworkImage(user.avatar ?? ""),
        ),
        trailing: const Icon(Icons.arrow_circle_right,color: Colors.white,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        tileColor: Colors.black38,
        style: ListTileStyle.list,

      ),
    );

  },
  itemCount: data.length,
  separatorBuilder: (context, index) {
    return const SizedBox(
      height: 10,
    );
  },);
}