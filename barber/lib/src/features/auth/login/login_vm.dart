import 'package:asyncstate/asyncstate.dart';
import 'package:barber/src/core/exceptions/service_exception.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/providers/application_providers.dart';
import 'package:barber/src/features/auth/login/login_state.dart';
import 'package:barber/src/models/user_model.dart';
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
        ref.invalidate(getMeProvider);
        ref.invalidate(getMyBarbershopProvider);
        final userModel = await ref.read(getMeProvider.future);
        switch (userModel) {
          case UserModelADM():
            state = state.copyWith(status: LoginStateStatus.adminLogin);
          case UserModelEmployee():
            state = state.copyWith(status: LoginStateStatus.employeelogin);
        }
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
