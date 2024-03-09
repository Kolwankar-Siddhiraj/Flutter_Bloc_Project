// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_bloc/features/home/bloc/home_bloc.dart';
import 'package:test_bloc/features/home/models/product_data_model.dart';

class HomeProductCardWidget extends StatelessWidget {
  const HomeProductCardWidget({super.key, required this.product, required this.homeBloc});

  final ProductDataModel product;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 12, left: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2.1, color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(product.imgUrl!), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 9),
          Text(
            product.name!,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Text(
            product.description!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price!}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductAddToWishlistButtonClickedEvent());
                      },
                      icon: Icon(Icons.favorite_rounded,
                          color: Colors.black, size: 30)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductAddToCartButtonClickedEvent());
                      },
                      icon: Icon(Icons.shopping_cart_rounded,
                          color: Colors.black, size: 30)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
