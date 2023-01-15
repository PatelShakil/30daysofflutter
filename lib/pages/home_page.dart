import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget buildUser(Users user) => ListTile(
        leading: CircleAvatar(child: Text("${user.name?.substring(0,1)} "),),
        title: Text("${user.name} "),
        subtitle: Text(user.password!)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: StreamBuilder<List<Users?>>(
        stream: readUsers(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            final users = snapshot.data!;
            return ListView(
              children: snapshot.data!.map((e) => buildUser(e!)).toList(),
            );
          }else{
            return Text('Something Went Wrong ${snapshot.error}' );
          }
        }),
      );
  }

  Stream<List<Users>> readUsers() =>
      FirebaseFirestore.instance.collection("users").snapshots().map((
          event) => event.docs.map((e) => Users.fromJson(e.data() )).toList());
}
class Users{
  late String? name;
  late String? email;
  late String? password;

  Users({required this.name, required this.email, required this.password});
  static Users fromJson(Map<String ,dynamic> json) => Users(
    name : json['name'],
    email : json['email'],
    password : json['password']
  );
}