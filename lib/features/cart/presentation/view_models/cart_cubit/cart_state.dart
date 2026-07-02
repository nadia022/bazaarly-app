import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CartState {}

/// Initial
final class CartInitial extends CartState {}

/// ---------------- Fetch Cart ----------------

final class FetchUserCartLoading extends CartState {}

final class FetchUserCartSuccess extends CartState {
  final UserCartResponse response;

  FetchUserCartSuccess({
    required this.response,
  });
}

final class FetchUserCartFailure extends CartState {
  final String errMessage;

  FetchUserCartFailure({
    required this.errMessage,
  });
}

/// ---------------- Actions ----------------

sealed class CartActionState extends CartState {}

final class AddToCartSuccess extends CartActionState {
  final String successMessage;

  AddToCartSuccess({
    required this.successMessage,
  });
}

final class AddToCartFailure extends CartActionState {
  final String errMessage;

  AddToCartFailure(this.errMessage);
}

final class RemoveFromCartSuccess extends CartActionState {
  final String successMessage;

  RemoveFromCartSuccess({
    required this.successMessage,
  });
}

final class RemoveFromCartFailure extends CartActionState {
  final String errMessage;

  RemoveFromCartFailure({
    required this.errMessage,
  });
}

final class UpdateCartItemQuantitySuccess extends CartActionState {
  final String successMessage;

  UpdateCartItemQuantitySuccess({
    required this.successMessage,
  });
}

final class UpdateCartItemQuantityFailure extends CartActionState {
  final String errMessage;

  UpdateCartItemQuantityFailure({
    required this.errMessage,
  });
}

final class ClearCartSuccess extends CartActionState {
  final String successMessage;

  ClearCartSuccess({
    required this.successMessage,
  });
}

final class ClearCartFailure extends CartActionState {
  final String errMessage;

  ClearCartFailure({
    required this.errMessage,
  });
}
