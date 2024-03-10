part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

// build states
class WishlistLoadingState extends WishlistState {}

class WishlistLoadingSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistProducts;

  WishlistLoadingSuccessState({required this.wishlistProducts});
}

class WishlistErrorState extends WishlistState {}

// action states
class WishlistProductItemRemovedActionState extends WishlistActionState {}

class WishlistItemRemovedActionState extends WishlistActionState {}
