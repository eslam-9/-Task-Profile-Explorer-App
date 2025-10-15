import 'package:dio/dio.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://randomuser.me',
        headers: {'accept': 'application/json'},
      ),
    );
  }
}
