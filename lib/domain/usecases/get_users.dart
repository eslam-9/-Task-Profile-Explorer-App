import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);

  Future<List<User>> call(int count) {
    return repository.fetchUsers(count);
  }
}
