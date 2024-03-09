part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

// build states
class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

// action states
class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}
