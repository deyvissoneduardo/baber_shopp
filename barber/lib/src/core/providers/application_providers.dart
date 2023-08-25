import 'package:barber/src/core/rest_client/rest_client.dart';
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
