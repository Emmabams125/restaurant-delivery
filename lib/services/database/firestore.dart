import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // Save order to the database
  Future<void> saveOrderToDataBase(String receipt) async {
    try {
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
        // Add more fields as necessary
      });
      print('Order saved successfully'); // Log success
    } catch (e) {
      print('Failed to save order: $e'); // Log error
    }
  }
}
