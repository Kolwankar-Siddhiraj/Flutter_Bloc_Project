// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, avoid_types_as_parameter_names, empty_constructor_bodies, unnecessary_set_literal, avoid_print, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc/data/cart_items.dart';
import 'package:test_bloc/data/grocery_data.dart';
import 'package:test_bloc/data/wishlist_items.dart';
import 'package:test_bloc/features/home/models/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      print("Initial Home Event !");
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(HomeLoadingSuccessState(
          products: GroceryData.groceryItems
              .map((e) => ProductDataModel.fromJson(e))
              .toList()));
    });

    on<HomeNavigateWishlistButtonClickedEvent>((event, emit) {
      print("Navigate to Wishlist !");
      emit(HomeNavigateToWishlistActionState());
    });

    on<HomeNavigateCartButtonClickedEvent>((event, emit) {
      print("Navigate to Cart !");
      emit(HomeNavigateToCartActionState());
    });

    on<HomeProductAddToWishlistButtonClickedEvent>((event, emit) {
      print("Product add to Wishlist !");
      if (!wishlistItems.contains(event.clickedProduct)) {
        wishlistItems.add(event.clickedProduct);
      }
      emit(HomeProductItemAddedToWishlistActionState());
    });

    on<HomeProductAddToCartButtonClickedEvent>((event, emit) {
      print("Product add to Cart !");
      if (!cartItems.contains(event.clickedProduct)) {
        cartItems.add(event.clickedProduct);
      }
      emit(HomeProductItemAddedToCartActionState());
    });
  }
}
