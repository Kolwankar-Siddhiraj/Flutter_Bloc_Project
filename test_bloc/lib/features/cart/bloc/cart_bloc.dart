// ignore_for_file: empty_constructor_bodies, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc/data/cart_items.dart';
import 'package:test_bloc/features/home/models/product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>((event, emit) async {
      emit(CartLoadingState());
      await Future.delayed(Duration(seconds: 1));
      emit(CartLoadingSuccessState(cartProducts: cartItems));
    });

    on<CartItemRemovedFromCartEvent>((event, emit) {
      cartItems.remove(event.clickedProduct);
      emit(CartItemRemovedActionState());
      emit(CartLoadingSuccessState(cartProducts: cartItems));
    });
  }
}
