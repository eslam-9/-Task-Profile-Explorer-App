import 'package:dio/dio.dart';
import '../../models/user_dto.dart';

class RandomUserApiService {
  final Dio dio;
  RandomUserApiService(this.dio);

  Future<List<UserDto>> fetchUsers(int count) async {
    final response = await dio.get(
      '/api/',
      queryParameters: {'results': count},
    );
    final results = (response.data['results'] as List)
        .cast<Map<String, dynamic>>();
    return results.map(UserDto.fromJson).toList();
  }
}
