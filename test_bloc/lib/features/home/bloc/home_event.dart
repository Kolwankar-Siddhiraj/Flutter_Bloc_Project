part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductAddToWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductAddToCartButtonClickedEvent extends HomeEvent {}

class HomeNavigateWishlistButtonClickedEvent extends HomeEvent {}

class HomeNavigateCartButtonClickedEvent extends HomeEvent {}
