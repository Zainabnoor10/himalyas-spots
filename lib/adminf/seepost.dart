import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Adminpost extends StatefulWidget {
  const Adminpost({Key? key}) : super(key: key);

  @override
  State<Adminpost> createState() => _AdminpostState();
}

class _AdminpostState extends State<Adminpost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("Admin Posts",style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("admin")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final userReviews = snapshot.data!.docs;

                      if (userReviews.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.brown,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        primary: true,
                        shrinkWrap: true,
                        itemCount: userReviews.length,
                        itemBuilder: (context, index) {
                          final userReview = userReviews[index];
                          final userData = userReview.data();
                          final userName = userData.containsKey('posttitle')
                              ? userData['posttitle'] as String
                              : 'Unknown User';
                          final userReviewText = userData.containsKey('postdetail')
                              ? userData['postdetail'] as String
                              : 'No review from this user.';

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.brown,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    userName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  Text(
                                    userReviewText,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection("admin")
                                              .doc(userReview.id)
                                              .delete()
                                              .then((value) {
                                            print('POST DELETED');
                                          });
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.brown,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container(
                        child: Text('No Data Found'),
                      );
                    }
                  }

                  return Center(
                    child: CircularProgressIndicator(color: Colors.brown),
                  );
                },
              ),
            ],
          ),

        ));
  }
}
