import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikesNotifier extends StateNotifier<Set<String>> {
  LikesNotifier() : super(<String>{});

  void toggle(String id) {
    final next = {...state};
    if (!next.add(id)) {
      next.remove(id);
    }
    state = next;
  }

  bool isLiked(String id) => state.contains(id);
}

final likesProvider = StateNotifierProvider<LikesNotifier, Set<String>>(
  (ref) => LikesNotifier(),
);
