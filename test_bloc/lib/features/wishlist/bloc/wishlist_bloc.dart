// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc/data/wishlist_items.dart';
import 'package:test_bloc/features/home/models/product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>((event, emit) async {
      emit(WishlistLoadingState());
      await Future.delayed(Duration(seconds: 1));
      emit(WishlistLoadingSuccessState(wishlistProducts: wishlistItems));
    });

    on<WishlistItemRemovedFromWishlistEvent>((event, emit) {
      wishlistItems.remove(event.clickedProduct);
      emit(WishlistItemRemovedActionState());
      emit(WishlistLoadingSuccessState(wishlistProducts: wishlistItems));
    });
  }
}
