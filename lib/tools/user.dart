import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData extends StatefulWidget {
  const GetData({Key key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats/XYSDa16jZBO5CUMwIk0h/messages')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return ListView.builder(
          itemCount: streamSnapshot.data.docs.length,
          itemBuilder: (ctx, index) =>
              Text(streamSnapshot.data.docs[index]['text']),
        );
      },
    );
  }
}
