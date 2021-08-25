import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback/services/auth.dart';
import 'package:feedback/services/dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


// class DashboardScreen extends StatefulWidget {
//
//   static String id = 'dash_screen';
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   // final FirebaseAuth _firebaseAuth;
//   //
//   // _DashboardScreenState(this._firebaseAuth);
//
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _genderController = TextEditingController();
//   TextEditingController _scoreController = TextEditingController();
//
//
//   List userProfilesList = [];
//   String userID = "";
//   Stream collectionStream = FirebaseFirestore.instance.collection('customerInfo').snapshots();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//         ),
//         body: Container(
//             child: ListView.builder(
//                 itemCount: userProfilesList.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(),
//                       subtitle: Text(userProfilesList[index]['gender']),
//                       leading: CircleAvatar(
//                         child: Row(
//                           children: [
//                             ElevatedButton(onPressed: (){
//                             }, child: Text('butoon')
//                             ),
//                             Image(
//                               image: AssetImage('assets/Profile_Image.png'),
//                             ),
//                           ],
//                         ),
//                       ),
//                       trailing: Text('${userProfilesList[index]['score']}'),
//                     ),
//                   );
//                 })));
//   }
//
// }


class DashboardScreen extends StatefulWidget {
  static String id = 'dash_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

