import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/models/babershop_model.dart';
import 'package:barber/src/models/user_model.dart';

import '../../core/fp/nil.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryExecption, BabershopModel>> getMyBabershop(
      UserModel userModel);

  Future<Either<RepositoryExecption, Nil>> save(
      ({
        String name,
        String email,
        List<String> openingDays,
        List<int> openingHours,
      }) data);
}
