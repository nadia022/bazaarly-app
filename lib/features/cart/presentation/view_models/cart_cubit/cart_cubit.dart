import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;

  UserCartResponse? cartResponse;

  Future<void> addToCart({required String productId}) async {
    final result = await cartRepo.addToCart(productId: productId);

    result.fold(
      (failure) => emit(AddToCartFailure(failure)),
      (success) => emit(AddToCartSuccess(successMessage: success)),
    );
  }

  Future<void> fetchUserCart({bool isRefresh = true}) async {
    if (isRefresh) {
      emit(FetchUserCartLoading());
    }

    final result = await cartRepo.fetchUserCart();

    result.fold(
      (failure) => emit(FetchUserCartFailure(errMessage: failure)),
      (success) {
        cartResponse = success;
        emit(FetchUserCartSuccess(response: success));
      },
    );
  }

  Future<void> removeFromCart({required String productId}) async {
    final result = await cartRepo.removeFromCart(productId: productId);

    result.fold(
      (failure) => emit(RemoveFromCartFailure(errMessage: failure)),
      (success) => emit(RemoveFromCartSuccess(successMessage: success)),
    );
  }

  Future<void> updateCartItemQuantity({
    required String productId,
    required int quantity,
  }) async {
    final result = await cartRepo.updateCartItemQuantity(
      productId: productId,
      quantity: quantity,
    );

    result.fold(
      (failure) =>
          emit(UpdateCartItemQuantityFailure(errMessage: failure)),
      (success) =>
          emit(UpdateCartItemQuantitySuccess(successMessage: success)),
    );
  }

  Future<void> clearCart() async {
    final result = await cartRepo.clearCart();

    result.fold(
      (failure) => emit(ClearCartFailure(errMessage: failure)),
      (success) => emit(ClearCartSuccess(successMessage: success)),
    );
  }
}
