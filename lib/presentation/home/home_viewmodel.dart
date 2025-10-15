import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';
import '../providers.dart';

class HomeViewModel extends StateNotifier<AsyncValue<List<User>>> {
  final GetUsers _getUsers;

  HomeViewModel(this._getUsers) : super(const AsyncValue.loading()) {
    fetch();
  }

  Future<void> fetch({int count = 20}) async {
    state = const AsyncValue.loading();
    try {
      final users = await _getUsers(count);
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await fetch();
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<List<User>>>(
      (ref) => HomeViewModel(ref.read(getUsersProvider)),
    );
