import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DashBoardService{

  final FirebaseAuth _firebaseAuth;

  DashBoardService(this._firebaseAuth);
  final CollectionReference profileList = FirebaseFirestore.instance.collection('customerInfo');

  Future<void> createCustomerData(
      String name, String email, String phone, String uid) async {

    return await profileList
        .doc(uid)
        .set({'name': name, 'email': email, 'phone': phone});
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  updateUserList(String name, String email, String phone, String userID) {}
}