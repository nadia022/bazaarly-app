import 'package:bazarly_app/features/home/data/repos/home_repo.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeatchCubit extends Cubit<HomeFetchState> {
  HomeRepo homeRepo;
  HomeFeatchCubit(this.homeRepo) : super(HomeInitial());

  Future<void> fetchGategories() async {
    emit(GategoriesFetchLoading());
    var result = await homeRepo.fetchAllCategories();
    result.fold(
      (failure) {
        emit(GategoriesFetchFailure(failure));
      },
      (gategories) {
        emit(GategoriesFetchSuccess(gategories));
      },
    );
  }

  Future<void> fetchBrands() async {
    emit(BrandsFetchLoading());
    var result = await homeRepo.fetchAllBrands();
    result.fold(
      (failure) {
        emit(BrandsFetchFailure(failure));
      },
      (brands) {
        emit(BrandsFetchSuccess(brands));
      },
    );
  }
}
