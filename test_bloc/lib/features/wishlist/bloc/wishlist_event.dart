part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemRemovedFromWishlistEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  WishlistItemRemovedFromWishlistEvent({required this.clickedProduct});
}
