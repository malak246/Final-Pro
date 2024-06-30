// lib/models/order.dart
import '../models/order.dart'
    as my; // Change 'request_model.dart' to 'order.dart'

class Order {
  String? id;
  String customerName;
  String product;
  int quantity;
  String status;

  Order({
    this.id,
    required this.customerName,
    required this.product,
    required this.quantity,
    required this.status,
  });

  // Convert an Order object into a map
  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'product': product,
      'quantity': quantity,
      'status': status,
    };
  }

  // Create an Order object from a map
  factory Order.fromMap(Map<String, dynamic> map, String documentId) {
    return Order(
      id: documentId,
      customerName: map['customerName'] ?? '',
      product: map['product'] ?? '',
      quantity: map['quantity'] ?? 0,
      status: map['status'] ?? '',
    );
  }
}
