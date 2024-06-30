import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/src/features/models/Admin_model.dart';

class AdminRepository {
  final CollectionReference _adminCollection =
      FirebaseFirestore.instance.collection('admins');

  Future<void> addAdmin(Admin admin) async {
    await _adminCollection.doc(admin.adminId).set(admin.toMap());
  }

  Future<void> updateAdmin(Admin admin) async {
    await _adminCollection.doc(admin.adminId).update(admin.toMap());
  }

  Future<void> deleteAdmin(String adminId) async {
    await _adminCollection.doc(adminId).delete();
  }

  Future<Admin?> getAdminById(String adminId) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await _adminCollection
        .doc(adminId)
        .get() as DocumentSnapshot<Map<String, dynamic>>;
    if (doc.exists) {
      return Admin.fromMap(doc.data()!);
    }
    return null;
  }

  Stream<List<Admin>> getAdminsStream() {
    return _adminCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Admin.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
