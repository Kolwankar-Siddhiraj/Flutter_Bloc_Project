part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductAddToWishlistButtonClickedEvent extends HomeEvent {
  HomeProductAddToWishlistButtonClickedEvent({required this.clickedProduct});

  final ProductDataModel clickedProduct;
}

class HomeProductAddToCartButtonClickedEvent extends HomeEvent {
  HomeProductAddToCartButtonClickedEvent({required this.clickedProduct});

  final ProductDataModel clickedProduct;
}

class HomeNavigateWishlistButtonClickedEvent extends HomeEvent {}

class HomeNavigateCartButtonClickedEvent extends HomeEvent {}
