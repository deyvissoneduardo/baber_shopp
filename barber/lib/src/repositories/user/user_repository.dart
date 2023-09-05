import 'package:barber/src/core/exceptions/auth_exception.dart';
import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/models/user_model.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
  Future<Either<RepositoryExecption, UserModel>> me();
  Future<Either<RepositoryExecption, Nil>> registerAdm(
      ({String name, String email, String password}) userData);

  Future<Either<RepositoryExecption, List<UserModel>>> getEmployees(
      int barbershopId);

  Future<Either<RepositoryExecption, Nil>> registerAdmAsEmployee(
      ({
        List<String> workDays,
        List<int> workHours,
      }) userModel);

  Future<Either<RepositoryExecption, Nil>> registerEmployee(
      ({
        int barbershopId,
        String name,
        String email,
        String password,
        List<String> workDays,
        List<int> workHours,
      }) userModel);
}
