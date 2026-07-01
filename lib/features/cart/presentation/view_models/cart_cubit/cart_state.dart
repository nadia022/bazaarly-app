import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CartState {}

/// Initial state before any data fetching begins.
final class CartInitial extends CartState {}

// states for adding a product to the cart
final class AddTocartSuccess extends CartState {
  final String successMessage;
  AddTocartSuccess({required this.successMessage});
}

final class AddToCartFailure extends CartState {
  final String errMessage;
  AddToCartFailure(this.errMessage);
}

/// States for fetching the user's cart
final class FetchUserCartLoading extends CartState{}
final class FetchUserCartFailure extends CartState{
  final String errMessage;

  FetchUserCartFailure({required this.errMessage});

}
final class FetchUserCartSuccess extends CartState{
  final UserCartResponse response;
  FetchUserCartSuccess({required this.response});

}


/// States for removing a product from the cart
final class RemoveFromCartFailure extends CartState{
  final String errMessage;
  RemoveFromCartFailure({required this.errMessage});
}
final class RemoveFromCartSuccess extends CartState{
  final String successMessage;
  RemoveFromCartSuccess({required this.successMessage});
}

/// States for updating the quantity of a product in the cart
final class UpdateCartItemQuantityFailure extends CartState{
  final String errMessage;
  UpdateCartItemQuantityFailure({required this.errMessage});
}
final class UpdateCartItemQuantitySuccess extends CartState{
  final String successMessage;
  UpdateCartItemQuantitySuccess({required this.successMessage});
}

/// States for clearing the user's cart
final class ClearCartFailure extends CartState{
  final String errMessage;
  ClearCartFailure({required this.errMessage});
}
final class ClearCartSuccess extends CartState{
  final String successMessage;
  ClearCartSuccess({required this.successMessage});
}

