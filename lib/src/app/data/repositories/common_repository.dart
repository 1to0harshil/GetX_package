import 'package:dartz/dartz.dart';
import 'package:get_x_structure/src/app/core/constants/urls.dart';
import 'package:get_x_structure/src/app/core/error/exceptions.dart';
import 'package:get_x_structure/src/app/core/error/failures.dart';
import 'package:get_x_structure/src/app/core/storage/get_storage_helper.dart';
import 'package:get_x_structure/src/app/data/model/response_model/get_productlist_response_model.dart';
import 'package:get_x_structure/src/app/network/api_controller.dart';

class CommonRepository {
  CommonRepository({required this.apiControllerV1});

  final ApiControllerV1 apiControllerV1;

  GetStorageHelper boxStorage = GetStorageHelper();

  Future<Either<Failure, GetProductListModel>> getProductList() async {
    try {
      final response = await apiControllerV1.get(
        path: EndPoints.getProducts,
      );

      return response.fold((failure) => Left(ApiFailure()),
          (response) => Right(GetProductListModel.fromJson(response)),);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
