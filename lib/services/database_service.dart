import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get user data
  Stream<DocumentSnapshot> getUserData(String uid) {
    return _firestore.collection('users').doc(uid).snapshots();
  }

  // Update user data
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).update(data);
  }

  // Create user data
  Future<void> createUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).set(data);
  }

  // Get all blood donation requests
  Stream<QuerySnapshot> getBloodDonationRequests() {
    return _firestore
        .collection('donation_requests')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Create blood donation request
  Future<void> createDonationRequest(Map<String, dynamic> data) async {
    await _firestore.collection('donation_requests').add(data);
  }

  // Update donation request status
  Future<void> updateDonationRequestStatus(
    String requestId,
    String status,
  ) async {
    await _firestore.collection('donation_requests').doc(requestId).update({
      'status': status,
    });
  }
}
