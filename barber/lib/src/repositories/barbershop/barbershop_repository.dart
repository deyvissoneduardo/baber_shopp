import 'package:barber/src/core/exceptions/repository_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/models/babershop_model.dart';
import 'package:barber/src/models/user_model.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryException, BabershopModel>> getMyBabershop(
      UserModel userModel);
}
