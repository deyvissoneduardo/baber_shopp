import 'package:barber/src/core/exceptions/auth_exception.dart';
import 'package:barber/src/core/exceptions/service_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/fp/nil.dart';
import 'package:barber/src/core/ui/helpers/local_key_constants.dart';
import 'package:barber/src/repositories/user/user_repository.dart';
import 'package:barber/src/service/user_login/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});
  @override
  Future<Either<ServiceException, Nil>> execute(
      String email, String password) async {
    final result = await userRepository.login(email, password);

    switch (result) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalKeyConstants.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthError() => Failure(ServiceException('Erro ao realizar login.')),
          AuthUnauthorized() =>
            Failure(ServiceException('Erro dados invalidos.')),
        };
    }
  }
}
