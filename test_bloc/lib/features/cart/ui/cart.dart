// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
