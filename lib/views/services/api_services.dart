import 'dart:convert';

import 'package:brainwired/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{

  Future<List<Product>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      Iterable usersJson = json.decode(response.body);
      List<Product> users = usersJson.map((json) => Product.fromJson(json)).toList();
      return users;
      
    } else {
      throw Exception('Failed to load users');
    }
  }

}