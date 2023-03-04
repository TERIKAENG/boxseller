import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/customer.dart';

class GetData {
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  Future<List<Customer>> getDataCustomers() async {
    // Get docs from collection reference

    QuerySnapshot querySnapshot = await customers.get();

    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return querySnapshot.docs
        .map((doc) => Customer.fromJson(doc.data().toString()))
        .toList();
  }
}
