import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/product_tab_view_body.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabView extends StatelessWidget {
  const ProductTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductFetchCubit(getIt<ProductRepo>())),],
      child: const ProductTabViewBody(),
    );
  }
}
