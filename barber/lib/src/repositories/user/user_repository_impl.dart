import 'dart:developer';
import 'dart:io';

import 'package:barber/src/core/exceptions/auth_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
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
}
