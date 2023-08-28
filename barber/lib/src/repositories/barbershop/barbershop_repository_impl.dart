// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
import 'package:barber/src/models/babershop_model.dart';
import 'package:barber/src/models/user_model.dart';
import 'package:barber/src/repositories/barbershop/barbershop_repository.dart';
import 'package:dio/dio.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final RestClient restClient;
  BarbershopRepositoryImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryException, BabershopModel>> getMyBabershop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) = await restClient.auth.get(
          '/babershop',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BabershopModel.fromMap(data));
      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/babershop/${userModel.barbershopId}',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BabershopModel.fromMap(data));
    }
  }
}
