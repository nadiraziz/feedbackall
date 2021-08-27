import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class CustomerInfoDashboard extends StatefulWidget {
  static String id = 'dash_screen';
  @override
  _CustomerInfoDashboardState createState() => _CustomerInfoDashboardState();
}

class _CustomerInfoDashboardState extends State<CustomerInfoDashboard> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('customerInfo').snapshots();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Scaffold(
            appBar: AppBar(title: Text('Customer Info')),
            body: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['email']),
                    leading: CircleAvatar(
                      child: Image(
                        image: AssetImage('assets/images/Profile_Image.png'),
                      ),
                    ),
                    trailing: SelectableText(data['phone']),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

