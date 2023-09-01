import 'package:asyncstate/asyncstate.dart';
import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/features/auth/register/user_register_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/application_providers.dart';

part 'user_register_vm.g.dart';

enum UserRegisterStateStatus {
  inital,
  success,
  error,
}

@riverpod
class UserRegisterVm extends _$UserRegisterVm {
  @override
  UserRegisterStateStatus build() => UserRegisterStateStatus.inital;

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    final userService = ref.watch(userRegisterAdmServiceProvider);

    final userData = (
      name: name,
      email: email,
      password: password,
    );

    final result = await userService.execute(userData).asyncLoader();

    switch (result) {
      case Success():
        ref.invalidate(getMeProvider);
        state = UserRegisterStateStatus.success;
      case Failure():
        state = UserRegisterStateStatus.error;
    }
    loaderHandler.close();
  }
}
