import 'package:asyncstate/asyncstate.dart';
import 'package:barber/src/core/exceptions/service_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/providers/application_providers.dart';
import 'package:barber/src/features/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVM extends _$LoginVM {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    final loginServce = ref.watch(userLoginServiceProvider);
    final result = await loginServce.execute(email, password);
    switch (result) {
      case Success():
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
        break;
      default:
    }
    loaderHandler.close();
  }
}
