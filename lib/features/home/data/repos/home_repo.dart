import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<String, List<ItemResponse>>> fetchAllCategories();
  Future<Either<String, List<ItemResponse>>> fetchAllBrands();
}
