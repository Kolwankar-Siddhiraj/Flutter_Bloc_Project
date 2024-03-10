// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:test_bloc/features/cart/ui/cart_product_card.dart';
import 'package:test_bloc/utils/show_snackbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();

    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartItemRemovedActionState) {
          displaySnackBar(context, true, "Item removed from Cart !");
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadingState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  "Cart Items",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),

              // body
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case CartLoadingSuccessState:
            final successState = state as CartLoadingSuccessState;

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(
                    "Cart Items",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),

                // body
                body: Container(
                  color: Color(0xFFF1FAFF),
                  child: ListView.builder(
                      itemCount: successState.cartProducts.length,
                      itemBuilder: (context, index) {
                        return CartProductCardWidget(
                            cartBloc: cartBloc,
                            product: successState.cartProducts[index]);
                      }),
                ));

          case CartErrorState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
              ),

              // body
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Error",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartInitialEvent());
                      },
                      icon: Icon(Icons.refresh_rounded, size: 34))
                ],
              ),
            );

          default:
            print("Deault case trigered !");
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
              ),

              // body
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Something went wrong !",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartInitialEvent());
                      },
                      icon: Icon(Icons.refresh_rounded, size: 34))
                ],
              ),
            );
        }
      },
    );
  }
}
