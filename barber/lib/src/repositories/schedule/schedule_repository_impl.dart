// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
import 'package:barber/src/models/schecule_model.dart';
import 'package:barber/src/repositories/schedule/schedule_repository.dart';
import 'package:dio/dio.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final RestClient restClient;

  ScheduleRepositoryImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryExecption, Nil>> scheduleClient(
      ({
        int barbershopId,
        String clientName,
        DateTime date,
        int time,
        int userId
      }) scheduleData) async {
    try {
      await restClient.auth.post('/schedules', data: {
        'barbershop_id': scheduleData.barbershopId,
        'user_id': scheduleData.userId,
        'client_name': scheduleData.clientName,
        'date': scheduleData.date.toIso8601String(),
        'time': scheduleData.time,
      });
      return Success(nil);
    } on DioException catch (e, s) {
      log('error ao agendar', error: e, stackTrace: s);
      return Failure(RepositoryExecption('error ao agendar'));
    }
  }

  @override
  Future<Either<RepositoryExecption, List<ScheculeModel>>> findScheduleByDate(
      ({DateTime time, int userId}) filter) async {
    try {
      final Response(:List data) =
          await restClient.auth.get('/schedules', queryParameters: {
        'user_id': filter.userId,
        'date': filter.time.toIso8601String(),
      });

      final schedules = data.map((e) => ScheculeModel.fromMap(e)).toList();
      return Success(schedules);
    } on DioException catch (e, s) {
      log('error buscar agenda', error: e, stackTrace: s);
      return Failure(RepositoryExecption('error buscar agenda'));
    } on ArgumentError catch (e, s) {
      log('Invalid Json', error: e, stackTrace: s);
      return Failure(RepositoryExecption(e.message));
    }
  }
}
