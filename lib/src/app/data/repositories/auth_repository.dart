import 'package:get_x_structure/src/app/network/api_controller.dart';

class AuthRepository {
  AuthRepository({required this.apiControllerV1});

  final ApiControllerV1 apiControllerV1;

// Future<Either<Failure, BaseModel<LoginData>>> login(
//     {required LoginRequestModel request}) async {
//   try {
//     final response = await apiControllerV1.post(
//       path: EndPoints.login,
//       data: request.toJson(),
//     );
//     return response.fold(
//       (failure) => Left(ApiFailure()),
//       (response) => Right(
//         BaseModel<LoginData>.fromJson(
//           response,
//           LoginData.fromJson,
//         ),
//       ),
//     );
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }
//
// Future<Either<Failure, GetUserProfileResponseModel>> userProfile() async {
//   try {
//     final response = await apiControllerV1.get(
//       path: EndPoints.getUserProfile,
//     );
//
//     return response.fold(
//       (failure) => Left(ApiFailure()),
//       (response) => Right(
//         GetUserProfileResponseModel.fromJson(
//           response,
//         ),
//       ),
//     );
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }
//
// Future<Either<Failure, BaseModel<dynamic>>> register(
//     {required RegisterRequestModel request}) async {
//   try {
//     final response = await apiControllerV1.post(
//       path: EndPoints.register,
//       data: request.toJson(),
//     );
//     return Right(BaseModel<dynamic>.fromJson(response, (data) => null));
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }

// Future<Either<Failure, UserListResponseModel>> userList() async {
//   try {
//     final response = await apiControllerV1.get(
//       path: EndPoints.userlist,
//     );
//     print("get res ${response}");
//     return Right(UserListResponseModel.fromJson(response));
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }

// Future<Either<Failure, BaseModel<LoginData>>> deleteUser(
//     {required userId}) async {
//   try {
//     final response = await apiControllerV1.post(
//       path: EndPoints.deleteUser + userId,
//     );

//     return Right(BaseModel<LoginData>.fromJson(
//         response, (data) => LoginData.fromJson(data)));
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }
}
