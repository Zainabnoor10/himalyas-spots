import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Operations extends StatefulWidget {
  const Operations({Key? key}) : super(key: key);

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Update Name'),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(hintText: 'Update Number'),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () async {
              await       FirebaseFirestore.instance.collection("users").doc().update({

                  "name":_nameController.text.trim(),
                  "phone": _phoneController.text.trim(),
              }).then((value) => (value) {
                print(
                    'print${_nameController.text},${_phoneController}');
              });
              _nameController.clear();
              _phoneController.clear();

                
              }, child: Text("Save")),
              ElevatedButton(onPressed: () async {
                await       FirebaseFirestore.instance.collection("users").doc().update({

                  "name":FieldValue.delete(),
                  "phone": FieldValue.delete(),
                }).then((value) => (value) {
                  print(
                      'print${_nameController.text},${_phoneController}');
                });
                _nameController.clear();
                _phoneController.clear();


              }, child: Text("delete"
                  ""))
            ],
          ),
          Center(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users')
                  .snapshots(),
              builder: (
                  (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>snapshot){
                    if (snapshot.hasData) {
                      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                          snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: docs.length,
                          shrinkWrap: true,
                          primary: true,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                            child:
                                            Text(docs[index]['name'].toString())
                                        ),
                                        Center(
                                            child:
                                            Text(docs[index]['phone'].toString())
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }));
                    }
                    return Center(child: Text("no data"));
                  }
              )
            ),
          ),

        ]
      ),
    );

  }
}
