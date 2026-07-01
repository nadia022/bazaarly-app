import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartRepo cartRepo;
  CartCubit( {required this.cartRepo}) : super(CartInitial());

  Future<void> addToCart({required String productId}) async {
    var result = await cartRepo.addToCart(productId: productId);
    result.fold(
      (failure) => emit(AddToCartFailure(failure)),
      (success) => emit(AddTocartSuccess(successMessage: success)),
    );
  }

  Future<void> fetchUserCart() async {
    emit(FetchUserCartLoading());
    var result = await cartRepo.fetchUserCart();
    result.fold(
      (failure) => emit(FetchUserCartFailure(errMessage: failure)),
      (success) => emit(FetchUserCartSuccess(response: success)),
    );
  }
}
