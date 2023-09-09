import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/providers/application_providers.dart';
import 'package:barber/src/models/schecule_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_schedule_vm.g.dart';

@riverpod
class EmployeeScheduleVm extends _$EmployeeScheduleVm {
  @override
  Future<List<ScheculeModel>> build(
      {required int userId, required DateTime date}) async {
    final repository = ref.read(scheduleRepositoryProvider);
    final result =
        await repository.findScheduleByDate((userId: userId, date: date));
    return switch (result) {
      Success(value: final schedules) => schedules,
      Failure(:final exception) => throw Exception(exception)
    };
  }
}
