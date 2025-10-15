import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/random_user_api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final RandomUserApiService apiService;
  UserRepositoryImpl(this.apiService);

  @override
  Future<List<User>> fetchUsers(int count) async {
    final dtos = await apiService.fetchUsers(count);
    return dtos.map((e) => e.toEntity()).toList();
  }
}
