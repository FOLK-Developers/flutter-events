import 'package:flutter/material.dart';
import 'package:folkeventapp_new/eventlist.dart';
import 'package:folkeventapp_new/eventdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:folkeventapp_new/eventdetails2.dart';
import 'package:folkeventapp_new/ed2.dart';
import 'package:folkeventapp_new/datepicker2.dart';

import 'package:table_calendar/table_calendar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Folk Event',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.red,
        accentColor: Colors.indigo,
      ),
      home: EventTwoPage1(),
    );
  }
}

class EventTwoPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              color: Colors.red.shade700,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.red.shade700,
            ),
          ),
        ],
        backgroundColor: Colors.white70,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.red.shade700,
            )),
        title: Text(
          'Folk Event',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        bottom: _buildBottomBar(),
      ),
      body: _buildShopItem(context),

    );
  }
}


PreferredSize _buildBottomBar() {
  return PreferredSize(
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Container(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.mic))),
          ),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(80.0),
  );
}




Widget _buildShopItem(BuildContext context) {
  return StreamBuilder(
    stream: Firestore.instance.collection("eventlists1").snapshots(),
    builder: (context, snapshot) {
      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, index) {
          DocumentSnapshot eventlists1 = snapshot.data.documents[index];
          return Card(
            child: new Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              margin: EdgeInsets.only(bottom: 20.0),
              height: 300,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) {
                            return EventDetail();
                          }));
                        },
                        child: new Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(eventlists1['img1']),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 10.0)
                              ]),
                        ),
                      )),
                  Expanded(
                    child: new Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              eventlists1['eventname1'],
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(eventlists1['category1'],
                              style:
                              TextStyle(color: Colors.grey, fontSize: 18.0)),

                          SizedBox(
                            height: 20.0,
                          ),
                          Text(eventlists1['date1'],
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.0,
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(eventlists1['venue1'],
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.red,
                                  height: 1.5)),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5.0, 5.0),
                                blurRadius: 10.0)
                          ]),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

