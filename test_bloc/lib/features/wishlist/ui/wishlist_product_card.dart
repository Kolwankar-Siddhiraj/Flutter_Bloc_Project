// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_bloc/features/home/models/product_data_model.dart';
import 'package:test_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistProductCardWidget extends StatelessWidget {
  const WishlistProductCardWidget(
      {super.key, required this.product, required this.wishlistBloc});

  final ProductDataModel product;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 12, left: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Color(0xFFFFF5EA),
          borderRadius: BorderRadius.circular(16),
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
              IconButton(
                  onPressed: () {
                    wishlistBloc.add(WishlistItemRemovedFromWishlistEvent(
                        clickedProduct: product));
                  },
                  icon: Icon(Icons.delete_forever_rounded,
                      color: Colors.red, size: 30)),
            ],
          )
        ],
      ),
    );
  }
}
