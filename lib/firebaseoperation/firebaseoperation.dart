import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User')
              // .orderBy('age', descending: true)
              // .where('age', isGreaterThan: 10)
                  .snapshots(),
              builder: ((context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                      snapshot.data!.docs;
                  return Container(
                    height: 400,
                    width: 400,
                    color: Colors.green,
                    child: ListView.builder(
                        itemCount: docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                height: 30,
                                color: Colors.yellowAccent,
                                child: InkWell(
                                  onTap: () {
                                    print(docs[index].id);
                                  },
                                  child: Center(
                                      child:
                                      Text(docs[index]['name'].toString())),
                                )),
                          );
                        })),
                  );
                }
                return Center(child: Text("no data"));
              }))),
    );
  }
}

