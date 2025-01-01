import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:onyx/core/api/api_consumer.dart';
import 'package:onyx/core/api/end_ponits.dart';
import 'package:onyx/core/cache/cache_helper.dart';
import 'package:onyx/core/errors/exceptions.dart';
import 'package:onyx/core/model/sign_in_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
    required String id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.id: id,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  getUserProfile() {}


  
}
