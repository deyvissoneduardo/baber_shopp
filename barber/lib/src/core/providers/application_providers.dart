import 'package:barber/src/core/fp/either.dart';
import 'package:barber/src/core/rest_client/rest_client.dart';
import 'package:barber/src/models/babershop_model.dart';
import 'package:barber/src/models/user_model.dart';
import 'package:barber/src/repositories/barbershop/barbershop_repository.dart';
import 'package:barber/src/repositories/barbershop/barbershop_repository_impl.dart';
import 'package:barber/src/repositories/user/user_repository.dart';
import 'package:barber/src/repositories/user/user_repository_impl.dart';
import 'package:barber/src/service/user_login/user_login_service.dart';
import 'package:barber/src/service/user_login/user_login_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));

@Riverpod(keepAlive: true)
BarbershopRepository barbershopRepository(BarbershopRepositoryRef ref) =>
    BarbershopRepositoryImpl(restClient: ref.watch(restClientProvider));

@Riverpod(keepAlive: true)
Future<UserModel> getMe(GetMeRef ref) async {
  final result = await ref.watch(userRepositoryProvider).me();

  return switch (result) {
    Success(value: final userModel) => userModel,
    Failure(:final exception) => throw exception,
  };
}

@Riverpod(keepAlive: true)
Future<BabershopModel> getMyBarbershop(GetMyBarbershopRef ref) async {
  final userModel = await ref.watch(getMeProvider.future);
  final barbershopRepository = ref.watch(barbershopRepositoryProvider);
  final result = barbershopRepository.getMyBabershop(userModel);

  return switch (result) {
    Success(value: final babershop) => babershop,
    Failure(:final exception) => throw exception,
    _ => ArgumentError('Error Barbershop')
  };
}
