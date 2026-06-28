import 'package:bazarly_app/core/errors/exceptions/api_exception.dart';
import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:bazarly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  ApiConsumer apiConsumer;
  HomeRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<ItemResponse>>> fetchAllCategories() async {
    try {
      Map<String, dynamic> response = await apiConsumer.get(
        EndPoints.getAllCategories,
      );
      List<ItemResponse> categories = (response['data'] as List)
          .map((e) => ItemResponse.fromJson(e))
          .toList();
      return Right(categories);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ItemResponse>>> fetchAllBrands() async {
    try {
      Map<String, dynamic> response = await apiConsumer.get(
        EndPoints.getAllBrands,
      );
      List<ItemResponse> brands = (response['data'] as List)
          .map((e) => ItemResponse.fromJson(e))
          .toList();
      return Right(brands);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
