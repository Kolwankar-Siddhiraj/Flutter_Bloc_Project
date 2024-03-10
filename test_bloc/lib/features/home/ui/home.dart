// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/features/cart/ui/cart.dart';
import 'package:test_bloc/features/home/bloc/home_bloc.dart';
import 'package:test_bloc/features/home/ui/home_product_card.dart';
import 'package:test_bloc/features/wishlist/ui/wishlist.dart';
import 'package:test_bloc/utils/show_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WishlistScreen()));
        } else if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        }
        if (state is HomeProductItemAddedToWishlistActionState) {
          displaySnackBar(context, true, "Item added to Wishlist !");
        }
        if (state is HomeProductItemAddedToCartActionState) {
          displaySnackBar(context, true, "Item added to Cart !");
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  "Siddhiraj's Grocery App",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),

              // body
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(
                    "Siddhiraj's Grocery App",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc
                              .add(HomeNavigateWishlistButtonClickedEvent());
                        },
                        icon: Icon(Icons.favorite_rounded,
                            color: Colors.white, size: 30)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeNavigateCartButtonClickedEvent());
                        },
                        icon: Icon(Icons.shopping_cart_rounded,
                            color: Colors.white, size: 30)),
                  ],
                ),

                // body
                body: Container(
                  color: Color(0xFFF1FAFF),
                  child: ListView.builder(
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return HomeProductCardWidget(
                            homeBloc: homeBloc,
                            product: successState.products[index]);
                      }),
                ));

          case HomeErrorState:
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
                        homeBloc.add(HomeInitialEvent());
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
                        homeBloc.add(HomeInitialEvent());
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
