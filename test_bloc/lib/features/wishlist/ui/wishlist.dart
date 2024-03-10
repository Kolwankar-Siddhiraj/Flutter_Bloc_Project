// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:test_bloc/features/wishlist/ui/wishlist_product_card.dart';
import 'package:test_bloc/utils/show_snackbar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();

    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        if (state is WishlistItemRemovedActionState) {
          displaySnackBar(context, true, "Item removed from Wishlist !");
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  "Wishlist Items",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),

              // body
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case WishlistLoadingSuccessState:
            final successState = state as WishlistLoadingSuccessState;

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(
                    "Wishlist Items",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),

                // body
                body: Container(
                  color: Color(0xFFF1FAFF),
                  child: ListView.builder(
                      itemCount: successState.wishlistProducts.length,
                      itemBuilder: (context, index) {
                        return WishlistProductCardWidget(
                            wishlistBloc: wishlistBloc,
                            product: successState.wishlistProducts[index]);
                      }),
                ));

          case WishlistErrorState:
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
                        wishlistBloc.add(WishlistInitialEvent());
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
                        wishlistBloc.add(WishlistInitialEvent());
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
