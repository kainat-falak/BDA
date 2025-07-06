import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();

    // Configure emulators
    if (const bool.fromEnvironment('USE_FIREBASE_EMULATOR')) {
      // Auth emulator
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

      // Firestore emulator
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

      // Storage emulator
      FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    }
  }
}
