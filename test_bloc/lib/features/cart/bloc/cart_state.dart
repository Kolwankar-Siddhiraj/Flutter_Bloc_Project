part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

// build states
class CartLoadingState extends CartState {}

class CartLoadingSuccessState extends CartState {
  final List<ProductDataModel> cartProducts;

  CartLoadingSuccessState({required this.cartProducts});
}

class CartErrorState extends CartState {}


// action states
class CartProductItemRemovedActionState extends CartActionState {}

class CartItemRemovedActionState extends CartActionState {}
