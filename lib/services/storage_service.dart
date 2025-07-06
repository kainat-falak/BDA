import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload profile picture
  Future<String> uploadProfilePicture(String uid, File image) async {
    try {
      final ref = _storage.ref().child('profile_pictures/$uid.jpg');
      await ref.putFile(image);
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  // Upload document
  Future<String> uploadDocument(
      String uid, String documentType, File file) async {
    try {
      final ref = _storage.ref().child('documents/$uid/$documentType.pdf');
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  // Delete file
  Future<void> deleteFile(String fileUrl) async {
    try {
      final ref = _storage.refFromURL(fileUrl);
      await ref.delete();
    } catch (e) {
      rethrow;
    }
  }
}
