// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/exceptions/service_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/repositories/user/user_repository.dart';
import 'package:barber/src/service/user_login/user_login_service.dart';
import 'package:barber/src/service/user_register/user_register_adm_service.dart';

class UserRegisterAdmServiceImpl implements UserRegisterAdmService {
  final UserRepository userRepository;
  final UserLoginService userLoginService;

  UserRegisterAdmServiceImpl({
    required this.userRepository,
    required this.userLoginService,
  });

  @override
  Future<Either<ServiceException, Nil>> execute(
      ({String email, String name, String password}) userData) async {
    final result = await userRepository.registerAdm(userData);

    switch (result) {
      case Success():
        return userLoginService.execute(userData.email, userData.password);
      case Failure(:final exception):
        return Failure(ServiceException(exception.message));
    }
  }
}
