import 'package:barber/src/core/exceptions/service_exception.dart';
import 'package:barber/src/core/fp/nil.dart';

import '../../core/fp/either.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceException, Nil>> execute(String email, String password);
}
