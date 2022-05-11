import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pets.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('pets');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addPet(Pet pet) {
    return collection.add(pet.toJson());
  }

  void updatePet(Pet pet) async {
    await collection.doc(pet.referenceId).update(pet.toJson());
  }

  void deletePet(Pet pet) async {
    await collection.doc(pet.referenceId).delete();
  }
}
