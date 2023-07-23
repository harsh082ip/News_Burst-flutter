import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String email;
  String uid;
  myUser({required this.email, required this.name, required this.uid});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uid': uid};
  }

  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
      email: snapshot['email'],
      name: snapshot['name'],
      uid: snapshot['uid'],
    );
  }
}
