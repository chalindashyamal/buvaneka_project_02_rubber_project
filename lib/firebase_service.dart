import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Stream getMeterData() {
    return _database
        .child('/')
        .onValue; // Replace '/' with your actual database path
  }
}
