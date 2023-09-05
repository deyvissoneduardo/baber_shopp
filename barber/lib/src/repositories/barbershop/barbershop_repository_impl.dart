// ignore_for_file: unused_field

import 'dart:developer';

import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
import 'package:barber/src/models/babershop_model.dart';
import 'package:barber/src/models/user_model.dart';
import 'package:dio/dio.dart';

import 'barbershop_repository.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final RestClient _restClient;

  BarbershopRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Either<RepositoryExecption, BarbershopModel>> getMyBarbershop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) = await _restClient.auth.get(
          '/barbershop',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BarbershopModel.fromMap(data));
      case UserModelEmployee():
        final Response(:data) =
            await _restClient.auth.get('/barbershop/${userModel.barbershopId}');
        return Success(BarbershopModel.fromMap(data));
    }
  }

  @override
  Future<Either<RepositoryExecption, Nil>> save(
      ({
        String email,
        String name,
        List<String> openingDays,
        List<int> openingHours,
      }) data) async {
    try {
      await _restClient.auth.post('/barbershop', data: {
        'user_id': '#userAuthRef',
        'name': data.name,
        'email': data.email,
        'opening_days': data.openingDays,
        'opening_hours': data.openingHours,
      });

      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar barbearia', error: e, stackTrace: s);
      return Failure(RepositoryExecption('Erro ao registrar barbearia'));
    }
  }
}
