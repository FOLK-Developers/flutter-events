import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folkeventapp_new/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance
                .collection("eventlists1")
                .document("Q1tiqE8bQ6aURJtsrpdQ")
                .collection("details")
                .snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot details = snapshot.data.documents[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          height: 550.0,
                          child: Image(image: NetworkImage(details['img']),fit: BoxFit.fill,
                          ),
                        ),
                        SafeArea(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    MaterialButton(
                                      padding: const EdgeInsets.all(8.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Icon(Icons.arrow_back_ios),
                                      color: Colors.white,
                                      textColor: Colors.black,
                                      minWidth: 0,
                                      height: 40,
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 340.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            details['title'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28.0),
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(Icons.favorite_border),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          child: Text(
                                            details['details'],
                                            style: TextStyle(
                                                color: Colors.grey.shade600),
                                          ),
                                        ),
                                        ExpansionTile(
                                          title: Text(
                                            details['details1'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text(details['details2']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(32.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0)),
                                    color: Colors.grey.shade900,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        details['date'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Spacer(),
                                      RaisedButton(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        onPressed: () {},
                                        color: Colors.orange,
                                        textColor: Colors.white,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              details['join'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            const SizedBox(width: 20.0),
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.orange,
                                                size: 16.0,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(10.0)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    );
                  });
            }));
  }
}
