import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/models/schecule_model.dart';

abstract class ScheduleRepository {
  Future<Either<RepositoryExecption, Nil>> scheduleClient(
      ({
        int barbershopId,
        int userId,
        String clientName,
        DateTime date,
        int time,
      }) scheduleData);

  Future<Either<RepositoryExecption, List<ScheculeModel>>> findScheduleByDate(
      ({DateTime time, int userId}) filter);
}
