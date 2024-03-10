part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartItemRemovedFromCartEvent extends CartEvent {
  final ProductDataModel clickedProduct;

  CartItemRemovedFromCartEvent({required this.clickedProduct});
}
