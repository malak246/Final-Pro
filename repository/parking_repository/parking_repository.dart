import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:Smart-Parking-App--/src/features/models/Parking_model.dart';



Class ParkingRepository extends GetxController{
static ParkingRepository get instance => Get.find();

final _db = FirebaseFirestore.instance;
createUser(parkingModel Parking) async{
await -db.collection("Parking").add(Parking.toJson()).whenComplete(
() => Get.snackbar("success","you account has been created.",
snackgroundColor: Colors.green.weithOpacity(0,1), 
colorText: Colors.green),
)
.catchError((error , stackTrace){
Get.snackbar("Error","Something went wrong.Try again",
snackPosition:SnackPosition.BOTTOM,
backgroundColor: Colors.redAccent.withOpacity(0,1),
colorText: Colors.red);
print(error.toString());
});
}
}