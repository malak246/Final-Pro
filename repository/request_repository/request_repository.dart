// lib/repositories/order_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/src/features/models/Request_model.dart';

class OrderRepository {
  final CollectionReference _orderCollection =
      FirebaseFirestore.instance.collection('orders');

  Future<void> addOrder(my.Order order) async {
    await _orderCollection.add(order.toMap());
  }

  Future<void> updateOrder(my.Order order) async {
    if (order.id != null) {
      await _orderCollection.doc(order.id).update(order.toMap());
    }
  }

  Future<void> deleteOrder(String orderId) async {
    await _orderCollection.doc(orderId).delete();
  }

  Future<List<my.Order>> getOrders() async {
    QuerySnapshot snapshot = await _orderCollection.get();
    return snapshot.docs.map((doc) {
      return my.Order.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Stream<List<my.Order>> getOrdersStream() {
    return _orderCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return my.Order.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
