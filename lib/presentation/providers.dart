import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/dio_client.dart';
import '../data/datasources/remote/random_user_api_service.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/usecases/get_users.dart';

final dioProvider = Provider((ref) => DioClient.create());

final apiServiceProvider = Provider(
  (ref) => RandomUserApiService(ref.read(dioProvider)),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(apiServiceProvider)),
);

final getUsersProvider = Provider<GetUsers>(
  (ref) => GetUsers(ref.read(userRepositoryProvider)),
);
