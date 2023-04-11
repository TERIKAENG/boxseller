import 'dart:convert';

import 'package:boxseller/model/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/customer.dart';
import '../model/order.dart';
import '../model/vender.dart';

class GetData {

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  Future<List<Customer>> getDataCustomers() async {
    // Get docs from collection reference
    List<Customer> list = [];
    QuerySnapshot querySnapshot = await customers.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();


    for (int i = 0; i < allData.length; i++) {
      var newjson = json.encode(allData[i]);
      Customer newCustomer = Customer.fromJson(newjson);
      newCustomer.id = querySnapshot.docs[i].id;
      list.add(newCustomer);
    }

    return list;
  }

    Future<Customer> getDataCustomerByID(String id) async {
    // Get docs from collection reference
    List<Customer> list = [];
    QuerySnapshot querySnapshot = await customers.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();


    for (int i = 0; i < allData.length; i++) {
      var newjson = json.encode(allData[i]);
      Customer newCustomer = Customer.fromJson(newjson);
      newCustomer.id = querySnapshot.docs[i].id;
        if('${newCustomer.id}' == id){
            return newCustomer;
        }
    }
    return Customer(name: '', tel: '', address: '');
  }

  CollectionReference venders =
      FirebaseFirestore.instance.collection('venders');

  Future<List<Vender>> getDataVenders() async {
    // Get docs from collection reference
    List<Vender> list = [];
    QuerySnapshot querySnapshot = await venders.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //  print(allData);

    for (int i = 0; i < allData.length; i++) {
      // print(allData[i].toString());
      var newjson = json.encode(allData[i]);
      Vender newVender = Vender.fromJson(newjson);
      newVender.id = querySnapshot.docs[i].id;
      list.add(newVender);
    }

    return list;
  }

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<List<BoxOrder>> getDataOrderByCustomer(String customerId) async {
    print(customerId);
    // Get docs from collection reference
    List<BoxOrder> list = [];
    QuerySnapshot querySnapshot = await orders.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (int i = 0; i < allData.length; i++) {
      print(allData[i]);
      var newjson = json.encode(allData[i]);

      BoxOrder newOrder = BoxOrder.fromJson(newjson);
      print(newOrder.toString());
      if (newOrder.customer == customerId) {
        newOrder.id = querySnapshot.docs[i].id;
        list.add(newOrder);
      }
    }

    return list;
  }

  CollectionReference materials =
      FirebaseFirestore.instance.collection('materials');

  Future<List<MaterialPaper>> getDataMaterialsByVender(String venderId) async {
    // Get docs from collection reference
    List<MaterialPaper> list = [];
    QuerySnapshot querySnapshot = await materials.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);

    for (int i = 0; i < allData.length; i++) {
      String newjson = json.encode(allData[i]);
      //print(newjson);
      MaterialPaper newMaterial = MaterialPaper.fromJson(newjson,0);
      if (newMaterial.vender == venderId) {
        newMaterial.id = querySnapshot.docs[i].id;
        list.add(newMaterial);
      }
    }

    return list;
  }

  Future<List<MaterialPaper>> getDataMaterialsBySpec(
      String paperType, String ronType) async {
    // Get docs from collection reference
    List<MaterialPaper> list = [];
    QuerySnapshot querySnapshot = await materials.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);

    for (int i = 0; i < allData.length; i++) {
      // print(allData[i].toString());
      var newjson = json.encode(allData[i]);
      MaterialPaper newMaterial = MaterialPaper.fromJson(newjson,0);
      if (newMaterial.paperType == paperType &&
          newMaterial.ronType == ronType) {
        newMaterial.id = querySnapshot.docs[i].id;
        list.add(newMaterial);
      }
    }

    return list;
  }
}
