import 'dart:developer';
import 'dart:io';

import 'package:barber/src/core/exceptions/auth_exception.dart';
import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
import 'package:barber/src/models/user_model.dart';
import 'package:barber/src/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(
      String email, String password) async {
    try {
      final Response(:data) = await restClient.unAuth.post(
        '/auth',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Success(data['access_token']);
    } on DioException catch (e, s) {
      log('Erro login', error: e, stackTrace: s);
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          log('Dados Invalidos', error: e, stackTrace: s);
          return Failure(AuthUnauthorized());
        }
      }
      return Failure(AuthError(message: e.message!));
    }
  }

  @override
  Future<Either<RepositoryExecption, UserModel>> me() async {
    try {
      final Response(:data) = await restClient.auth.get('/me');
      return Success(UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar usuario', error: e, stackTrace: s);
      return Failure(RepositoryExecption('Erro ao buscar usuario'));
    } on ArgumentError catch (e, s) {
      log('Invalid Json', error: e, stackTrace: s);
      return Failure(RepositoryExecption(e.message));
    }
  }

  @override
  Future<Either<RepositoryExecption, Nil>> registerAdm(
      ({String email, String name, String password}) userData) async {
    try {
      await restClient.unAuth.post('/users', data: {
        'name': userData.name,
        'email': userData.email,
        'password': userData.password,
        'profile': 'ADM'
      });
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar usuario admin', error: e, stackTrace: s);
      return Failure(RepositoryExecption('Erro ao registrar usuario admin'));
    }
  }

  @override
  Future<Either<RepositoryExecption, List<UserModel>>> getEmployees(
      int barbershopId) async {
    try {
      final Response(:List data) = await restClient.auth
          .get('/users', queryParameters: {'barbershop_id': barbershopId});

      final employees = data.map((e) => UserModelADM.fromMap(e)).toList();
      return Success(employees);
    } on DioException catch (e, s) {
      log('Erro ao buscar colaboradores', error: e, stackTrace: s);
      return Failure(
        RepositoryExecption('Erro ao buscar colaboradores'),
      );
    } on ArgumentError catch (e, s) {
      log('Erro ao converter colaboradores (Invalid Json)',
          error: e, stackTrace: s);
      return Failure(
        RepositoryExecption('Erro ao converter colaboradores (Invalid Json)'),
      );
    }
  }
}
