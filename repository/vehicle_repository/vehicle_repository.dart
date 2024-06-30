import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernlogintute/src/features/models/Slot_model.dart';

class RequestRepository extends GetxController {
  static RequestRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  createSlot(SlotModel Slot) async {
    await _db
        .collection("Vehicle")
        .add(Slot.toJson())
        .whenComplete(
          () => Get.snackbar("success", "you account has been created.",
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong.Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
